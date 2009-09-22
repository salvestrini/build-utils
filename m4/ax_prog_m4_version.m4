#####
#
# SYNOPSIS
#
#   AX_PROG_M4_VERSION([VERSION],[ACTION-IF-TRUE],[ACTION-IF-FALSE])
#
# DESCRIPTION
#
#   Makes sure that m4 supports the version indicated. If true the
#   shell commands in ACTION-IF-TRUE are executed. If not the shell
#   commands in ACTION-IF-FALSE are run. Note if $M4 is not set (for
#   example by running AC_CHECK_PROG or AC_PATH_PROG) will fail.
#
#   Example:
#
#     AC_PATH_PROG([M4],[m4])
#     AC_PROG_M4_VERSION([1.4.0],[ ... ],[ ... ])
#
#   This will check to make sure that the m4 you have supports at
#   least version 1.4.0.
#
#   NOTE: This macro uses the $M4 variable to perform the check.
#   AX_WITH_M4 can be used to set that variable prior to running this
#   macro. The $M4_VERSION variable will be valorized with the
#   detected version.
#
# LAST MODIFICATION
#
#   2008-03-12
#
# COPYLEFT
#
#   Copyright (c) 2008 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without
#   modification, are permitted in any medium without royalty provided
#   the copyright notice and this notice are preserved.

AC_DEFUN([AX_PROG_M4_VERSION],[
    AC_REQUIRE([AC_PROG_SED])
    AC_REQUIRE([AC_PROG_GREP])

    AS_IF([test -n "$M4"],[
        ax_m4_require_version="$1"

        AC_MSG_CHECKING([for m4 version])
        changequote(<<,>>)
        ax_m4_detected_version=`$M4 --version 2>&1 | $GREP "^m4\ " | $SED -e 's/.* \([0-9]*\.[0-9]*\.[0-9]*\)/\1/'`
        changequote([,])
        AC_MSG_RESULT($ax_m4_detected_version)

	AC_SUBST([M4_VERSION],[$ax_m4_detected_version])

        AX_COMPARE_VERSION([$ax_required_m4_version],[le],[$ax_m4_detected_version],[
	    :
            $2
        ],[
	    :
            $3
        ])
    ],[
        AC_MSG_WARN([could not find the m4 program])
        $3
    ])
])
