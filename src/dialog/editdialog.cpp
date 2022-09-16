/*
 * Copyright (C) 2014 Red Hat
 *
 * This file is part of openconnect-gui.
 *
 * openconnect-gui is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "editdialog.h"
#include "VpnProtocolModel.h"
#include "common.h"
#include "server_storage.h"
#include "ui_editdialog.h"
#include <QFileDialog>
#include <QItemSelectionModel>
#include <QListWidget>
#include <QMessageBox>

// FIXME: this include should to into <openconnect.h>
#ifdef _WIN32
#include <winsock2.h>
#endif

extern "C" {
#include <openconnect.h>
}

#ifdef USE_SYSTEM_KEYS
extern "C" {
#include <gnutls/system-keys.h>
}
#endif

static int token_tab(int mode)
{
    switch (mode) {
    case OC_TOKEN_MODE_HOTP:
        return 0;
    case OC_TOKEN_MODE_TOTP:
        return 1;
    case OC_TOKEN_MODE_STOKEN:
        return 2;
    default:
        return -1;
    }
}

static int token_rtab[] = {
    [0] = OC_TOKEN_MODE_HOTP,
    [1] = OC_TOKEN_MODE_TOTP,
    [2] = OC_TOKEN_MODE_STOKEN
};

void EditDialog::load_win_certs()
{
#ifdef USE_SYSTEM_KEYS
    QString prekey = ss->get_key_url();

    this->winCerts.clear();

    int ret = -1;
    gnutls_system_key_iter_t iter = nullptr;
    char* cert_url;
    char* key_url;
    char* label;
    int row = 0;
    int idx = -1;
    do {
        ret = gnutls_system_key_iter_get_info(&iter, GNUTLS_CRT_X509, &cert_url, &key_url, &label,
            nullptr, 0);
        if (ret >= 0) {
            win_cert_st st;
            QString l;
            if (label != nullptr)
                l = QString::fromUtf8(label);
            else
                l = QString::fromUtf8(cert_url);
            if (prekey.isEmpty() == false) {
                if (QString::compare(prekey, QString::fromUtf8(key_url), Qt::CaseSensitive) == 0) {
                    idx = row;
                }
            }
            row++;

            st.label = l;
            st.key_url = QString::fromUtf8(key_url);
            st.cert_url = QString::fromUtf8(cert_url);
            this->winCerts.push_back(st);
        }
    } while (ret >= 0);

    gnutls_system_key_iter_deinit(iter);
#endif
}

EditDialog::EditDialog(QString server, QWidget* parent)
    : QDialog(parent)
    , ui(new Ui::EditDialog)
    , ss(new StoredServer())
{
    ui->setupUi(this);

    VpnProtocolModel* model = new VpnProtocolModel(this);
    ui->protocolComboBox->setModel(model);

    if (ss->load(server) < 0) {
        QMessageBox::information(this,
            qApp->applicationName(),
            ss->m_last_err.isEmpty() ? tr("Some server information failed to load") : ss->m_last_err);
    }

    ss->set_window(this);

    QString txt = ss->get_label();
    ui->nameEdit->setText(txt);
    if (txt.isEmpty() == true) {
        ui->nameEdit->setText(server);
    }

    ui->usernameEdit->setText(ss->get_username());
    ui->gatewayEdit->setText(ss->get_servername());


    // Load the windows certificates
    load_win_certs();

    int type = ss->get_token_type();


    ui->protocolComboBox->setCurrentIndex(ss->get_protocol_id());

    QString hash;
    ss->get_server_hash(hash);

}

EditDialog::~EditDialog()
{
    delete ui;
    delete ss;
}

QString EditDialog::getEditedProfileName() const
{
    return ss->get_label();
}

void EditDialog::on_buttonBox_accepted()
{
    if (ui->gatewayEdit->text().isEmpty() == true) {
        QMessageBox::information(this,
            qApp->applicationName(),
            tr("You need to specify a gateway. E.g. vpn.example.com:443"));
        return;
    }

    if (ui->nameEdit->text().isEmpty() == true) {
        QMessageBox::information(this,
            qApp->applicationName(),
            tr("You need to specify a name for this connection. E.g. 'My company'"));
        return;
    }

    if (ss->client_is_complete() != true) {
        QMessageBox::information(this,
            qApp->applicationName(),
            tr("There is a client certificate specified but no key!"));
        return;
    }
    ss->set_label(ui->nameEdit->text());
    ss->set_username(ui->usernameEdit->text());
    ss->set_servername(ui->gatewayEdit->text());

    ss->set_protocol_id(ui->protocolComboBox->currentIndex());
    ss->set_protocol_name(ui->protocolComboBox->currentData(Qt::UserRole + 1).toString());

    ss->save();
    this->accept();
}

void EditDialog::on_buttonBox_rejected()
{
    this->reject();
}

void EditDialog::on_userCertButton_clicked()
{
    QString filename = QFileDialog::getOpenFileName(this,
        tr("Open certificate"), "",
        tr("Certificate Files (*.crt *.pem *.der *.p12)"));

    // FIXME: check empty result

}

void EditDialog::on_userKeyButton_clicked()
{
    QString filename = QFileDialog::getOpenFileName(this,
        tr("Open private key"), "",
        tr("Private key Files (*.key *.pem *.der *.p8 *.p12)"));

    // FIXME: check empty result
}

void EditDialog::on_caCertButton_clicked()
{
    QString filename = QFileDialog::getOpenFileName(this,
        tr("Open certificate"), "",
        tr("Certificate Files (*.crt *.pem *.der)"));

    // FIXME: check empty result
}

void EditDialog::on_userCertClear_clicked()
{
    ss->clear_cert();
}

void EditDialog::on_userKeyClear_clicked()
{
    ss->clear_key();
}

void EditDialog::on_caCertClear_clicked()
{
    ss->clear_ca();
}

void EditDialog::on_serverCertClear_clicked()
{
    ss->clear_server_hash();
}

void EditDialog::on_tokenClear_clicked()
{

}

void EditDialog::on_groupnameClear_clicked()
{
    ss->clear_groupname();
}

void EditDialog::on_loadWinCert_clicked()
{

}

void EditDialog::on_groupnameEdit_textChanged(const QString& arg1)
{

}

void EditDialog::on_caCertEdit_textChanged(const QString& arg1)
{

}

void EditDialog::on_serverCertHash_textChanged(const QString& arg1)
{

}

void EditDialog::on_tokenEdit_textChanged(const QString& arg1)
{

}

void EditDialog::on_userCertEdit_textChanged(const QString& arg1)
{

}

void EditDialog::on_userKeyEdit_textChanged(const QString& arg1)
{

}

void EditDialog::on_loadWinCertList_itemSelectionChanged()
{

}

void EditDialog::on_resetWinCertSelection_clicked()
{
    on_userCertClear_clicked();
    on_userKeyClear_clicked();
}
