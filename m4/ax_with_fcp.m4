#
# SYNOPSIS
#
#   AX_WITH_FCP([VALUE-IF-NOT-FOUND],[PATH])
#
# DESCRIPTION
#
#   Locates an installed Filter Chains Processor binary, placing the result
#   in the precious variable $FCP.
#   Accepts a present $FCP, then --with-fcp, and failing that searches for
#   fcp in the given path (which defaults to the system path). If fcp is
#   found, $FCP is set to the full path of the binary; if it is not found
#   $FCP is set to VALUE-IF-NOT-FOUND if provided, unchanged otherwise.
#
#   A typical use could be the following one:
#
#         AX_WITH_FCP
#
# LAST MODIFICATION
#
#   2008-05-05
#
# COPYLEFT
#
#   Copyright (c) 2008 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AC_DEFUN([AX_WITH_FCP],[
    AX_WITH_PROG(FCP,fcp,$1,$2)
])
