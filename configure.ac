#
#   Copyright (c) 2013-2014, Texas Instruments Incorporated
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
# ======== configure.ac ========
#

# Process this file with autoconf to produce a configure script.
AC_PREREQ(2.59)

# Initilize autoconf
AC_INIT(TI MMRPC, 1.0.0, )

# Set auxiliary build tools directory
AC_CONFIG_AUX_DIR([build-aux])

# Initilize automake
AM_INIT_AUTOMAKE([foreign])

# Disabling maintainer mode to prevent rebuild of configure script
AM_MAINTAINER_MODE([disable])

# Initalize libtool but disable fortran check
define([AC_LIBTOOL_LANG_F77_CONFIG], [:])dnl
AC_PROG_LIBTOOL(gcc)

# Checks for programs.
AC_PROG_CC(gcc)
AC_PROG_INSTALL

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([fcntl.h stdlib.h string.h sys/param.h sys/socket.h sys/time.h unistd.h])

# Export CFLAGS and LDFLAGS to Makefile(s)
AC_SUBST([AM_CFLAGS])
AC_SUBST([AM_LDFLAGS])

# Add config variables/options and check them
# Note that 6614 isn't documented and, though it may work, is planned for removal
AC_ARG_VAR(KERNEL_INSTALL_DIR, Installation path to the Linux kernel.)

# Test for required KERNEL path
AS_IF([test "x$KERNEL_INSTALL_DIR" = "x"],
  [AC_MSG_ERROR([Kernel path is not set])])

# Export optional user variable to Makefile(s)
AC_SUBST([KERNEL_INSTALL_DIR])

# Define specific variables to be used in Makefile.am
AM_CONDITIONAL([KDIR], [test "x$KERNEL_INSTALL_DIR" != "x"])

# Generate Makefile(s)
AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([libmmrpc.pc])
AC_OUTPUT

echo \
"-----------------------------------------------------------

Thank you for installing the Linux ${PACKAGE_NAME} package

Installation directory prefix: '${prefix}'.
Compilation command: '${CC} ${CFLAGS} ${CPPFLAGS}'

You have configured to build for the '${PLATFORM}' platform

Your KERNEL installation directory is set to:
    '${KERNEL_INSTALL_DIR}'

Now type 'make; sudo make install' to generate the program
and install it to your system.

------------------------------------------------------------"
