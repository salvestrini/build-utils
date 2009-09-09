#
# SYNOPSIS
#
#   AX_PACKAGE_VERSION_CHECK([COUNT],[MAJOR],[MINOR],[MICRO],[EXTRA],
#                            [ACTION-IF-SUCCESS],[ACTION-IF-FAILURE])
#
# DESCRIPTION
#
#   Check if version tokens (MAJOR, MINOR, MICRO and EXTRA) are correct.
#   COUNT specified how many tokens to check (eg, 1 check only MAJOR, 2
#   checks MAJOR and MINOR and so on).
#   If successfull executes ACTION-IF-SUCCESS otherwise ACTION-IF-FAILURE.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#   Copyright (c) 2009 Alessandro Massignan <ff0000.it@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AC_DEFUN([AX_PACKAGE_VERSION_CHECK],[
    AC_REQUIRE([AC_PROG_SED])
    AS_IF([test -z $1],[$1=4])

    AS_IF([test $1 -ge 1 && test ! -z $2],[
        AC_MSG_CHECKING([version major=$2])
        AS_IF([test ! -z "`echo $2 | sed -n '/[[0-9]][[0-9A-Za-z]]*/p;'`"],[
            AC_MSG_RESULT([success])
            $6
        ],[
            AC_MSG_RESULT([fail])
            $7
        ])
    ])

    AS_IF([test $1 -ge 2 && test ! -z $3],[
        AC_MSG_CHECKING([version minor=$3])
        AS_IF([test ! -z "`echo $3 | sed -n '/[[0-9]][[0-9A-Za-z]]*/p;'`"],[
            AC_MSG_RESULT([success])
            $6
        ],[
            AC_MSG_RESULT([fail])
            $7
        ])
    ])

    AS_IF([test $1 -ge 3 && test ! -z $4],[
        AC_MSG_CHECKING([version micro=$4])
        AS_IF([test ! -z "`echo $4 | sed -n '/[[0-9]][[0-9A-Za-z]]*/p;'`"],[
            AC_MSG_RESULT([success])
            $6
        ],[
            AC_MSG_RESULT([fail])
            $7
        ])
    ])

    AS_IF([test $1 -ge 4 && test ! -z $5],[
        AC_MSG_CHECKING([version extra=$5])
        AS_IF([test ! -z "`echo $5 | sed -n '/.*/p;'`"],[
            AC_MSG_RESULT([success])
            $6
        ],[
            AC_MSG_RESULT([fail])
            $7
        ])
    ])
])
