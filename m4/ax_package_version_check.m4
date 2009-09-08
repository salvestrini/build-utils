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
    COUNT=$1
    MAJOR=$2
    MINOR=$3
    MICRO=$4
    EXTRA=$5

    AS_IF([test -z $COUNT],[COUNT=4])

    AS_IF([test $COUNT -gt 0 && test ! -z $MAJOR],[
        AC_MSG_CHECKING([version major=$MAJOR])
        RESULT=`expr match $MAJOR '[[0-9]][[0-9A-Za-z]]*'`
        AS_IF([test $RESULT -gt 0],[
            AC_MSG_RESULT([success])
            $6],[
            AC_MSG_RESULT([fail])
            $7
        ])
        COUNT=`expr $COUNT - 1`
    ])

    AS_IF([test $COUNT -gt 0 && test ! -z $MINOR],[
        AC_MSG_CHECKING([version minor=$MINOR])
        RESULT=`expr match $MINOR '[[0-9]][[0-9A-Za-z]]*'`
        AS_IF([test $RESULT -gt 0],[
            AC_MSG_RESULT([success])
            $6],[
            AC_MSG_RESULT([fail])
            $7
        ])
        COUNT=`expr $COUNT - 1`
    ])

    AS_IF([test $COUNT -gt 0 && test ! -z $MICRO],[
        AC_MSG_CHECKING([version micro=$MICRO])
        RESULT=`expr match $MICRO '[[0-9]][[0-9A-Za-z]]*'`
        AS_IF([test $RESULT -gt 0],[
            AC_MSG_RESULT([success])
            $6],[
            AC_MSG_RESULT([fail])
            $7
        ])
        COUNT=`expr $COUNT - 1`
    ])

    AS_IF([test $COUNT -gt 0 && test ! -z $EXTRA],[
        AC_MSG_CHECKING([version extra=$EXTRA])
        RESULT=`expr match $EXTRA '.*'`
        AS_IF([test $RESULT -gt 0],[
            AC_MSG_RESULT([success])
            $6],[
            AC_MSG_RESULT([fail])
            $7
        ])
        COUNT=`expr $COUNT - 1`
    ])
])
