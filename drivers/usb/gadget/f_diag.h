/*
 * Gadget Driver for Android, with ADB and UMS and ACM support
 *
 * Copyright (C) 2009 Samsung Electronics, Seung-Soo Yang
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#ifndef __F_DIAG_H
#define __F_DIAG_H

int diag_function_add(struct usb_configuration *c);
int diag_function_config_changed(struct usb_composite_dev *cdev,
	struct usb_configuration *c);

#endif /* __F_DIAG_H */
