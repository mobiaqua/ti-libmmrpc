#
#   Copyright (c) 2012-2013, Texas Instruments Incorporated
#
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions
#   are met:
#
#   *  Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#
#   *  Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#
#   *  Neither the name of Texas Instruments Incorporated nor the names of
#      its contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
#   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
#   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
#   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#   OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#   OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
#   EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ======== ipc-linux.mak ========
#

.PHONY: config config-static config-shared

# If you need to add any compile flags to the build of IPC user libraries,
# you can use the CFLAGS option to the configure script.
#
# For example, in the very rare case where your kernel's AF_RPMSG
# definition isn't correctly detected by IPC (see
# linux/include/net/rpmsg.h), you can provide your kernel's definition
# of AF_RPMSG by adding this CFLAGS line to the configure commands below
# to force the value of AF_RPMSG to 42:
#
#            CFLAGS="-DAF_RPMSG=42"


config:
	@echo "Configuring Linux Ipc ..."
	./configure --host=$(TOOLCHAIN_LONGNAME) \
            CC=$(TOOLCHAIN_PREFIX)gcc \
            KERNEL_INSTALL_DIR=$(KERNEL_INSTALL_DIR)


config-static:
	@echo "Configuring Linux Ipc static only libaries ..."
	./configure --host=$(TOOLCHAIN_LONGNAME) --disable-shared \
            CC=$(TOOLCHAIN_PREFIX)gcc \
            KERNEL_INSTALL_DIR=$(KERNEL_INSTALL_DIR)


config-shared:
	@echo "Configuring Linux Ipc shared (dynamic) only libaries ..."
	./configure --host=$(TOOLCHAIN_LONGNAME) --disable-static \
            CC=$(TOOLCHAIN_PREFIX)gcc \
            KERNEL_INSTALL_DIR=$(KERNEL_INSTALL_DIR)
