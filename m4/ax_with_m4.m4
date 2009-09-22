#####
#
# SYNOPSIS
#
#   AX_WITH_M4([VALUE-IF-NOT-FOUND],[PATH])
#
# DESCRIPTION
#
#   Locates an installed M4 binary, placing the result in the
#   precious variable $M4. Accepts a present $M4, then --with-m4,
#   and failing that searches for m4 in the given path (which
#   defaults to the system path). If m4 is found, $M4 is set to the
#   full path of the binary; if it is not found, $M4 is set to
#   VALUE-IF-NOT-FOUND, which defaults to 'm4'.
#
# LAST MODIFICATION
#
#   2008-01-29
#
# COPYLEFT
#
#   Copyright (c) 2008 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without
#   modification, are permitted in any medium without royalty provided
#   the copyright notice and this notice are preserved.

AC_DEFUN([AX_WITH_M4],[
    AX_WITH_PROG(M4,m4)
])
