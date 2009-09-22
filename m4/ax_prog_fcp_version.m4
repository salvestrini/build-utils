#
# SYNOPSIS
#
#   AX_PROG_FCP_VERSION([VERSION],[ACTION-IF-TRUE],[ACTION-IF-FALSE])
#
# DESCRIPTION
#
#   Makes sure that fcp supports the version indicated. If true the shell
#   commands in ACTION-IF-TRUE are executed. If not the shell commands in
#   ACTION-IF-FALSE are run. Note if $FCP is not set (for example by
#   running AC_CHECK_PROG or AC_PATH_PROG) the macro will fail.
#
#   Example:
#
#     AC_PATH_PROG([FCP],[fcp])
#     AC_PROG_FCP_VERSION([1.0.0],[ ... ],[ ... ])
#
#   This will check to make sure that the fcp you have supports at least
#   version 1.0.0.
#
#   NOTE: This macro uses the $FCP variable to perform the check.
#   AX_WITH_FCP can be used to set that variable prior to running this
#   macro. The $FCP_VERSION variable will be valorized with the detected
#   version.
#
# LAST MODIFICATION
#
#   2008-11-12
#
# COPYLEFT
#
#   Copyright (c) 2008 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AC_DEFUN([AX_PROG_FCP_VERSION],[
    AC_REQUIRE([AC_PROG_SED])
    AC_REQUIRE([AC_PROG_GREP])

    AS_IF([test -n "$FCP"],[
        ax_fcp_version="$1"

        AC_MSG_CHECKING([for fcp version])
        changequote(<<,>>)
        fcp_version=`$FCP --version 2>&1 | $GREP "fcp" | $SED -e 's/.* \([0-9]*\.[0-9]*\.[0-9]*\)/\1/'`
        changequote([,])
        AC_MSG_RESULT($fcp_version)

	AC_SUBST([FCP_VERSION],[$fcp_version])

        AX_COMPARE_VERSION([$ax_fcp_version],[le],[$fcp_version],[
	    :
            $2
        ],[
	    :
            $3
        ])
    ],[
        AC_MSG_WARN([could not find the fcp binary])
        $3
    ])
])
