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

#pragma once

#include <QString>
#ifdef _WIN32
#include <winsock2.h>
#else
#include "common.h"
#endif
#if defined(__linux__) || defined(__FreeBSD__)
#define SOCKET int
#endif

#include <QString>

class VirtualIfInfo {
public:
    VirtualIfInfo();
    ~VirtualIfInfo();

    QVector<QString> get_if_names();
};
