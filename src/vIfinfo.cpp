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

#include "vIfinfo.h"
#include "config.h"
#include "gtdb.h"
#include "logger.h"

#include <QDir>
#include <cstdarg>
#include <cstdio>

extern "C" {
#include <openconnect.h>
}


VirtualIfInfo::VirtualIfInfo()
{

}

VirtualIfInfo::~VirtualIfInfo()
{

}

// darren add
QVector<QString> VirtualIfInfo::get_if_names()
{
    QVector<QString> ifNames;
    ifNames.push_back("default");  // add default
    char ifNamesStr[2048] = {0};
    get_all_ifnames(ifNamesStr);
    QString buffer = ifNamesStr;
    QStringList tmp_names = buffer.split("^^", QString::SkipEmptyParts);
    foreach (QString str, tmp_names)
    {
        ifNames.push_back(str);
    }
    return ifNames;
}
