#
# SYNOPSIS
#
#   AX_GIT_VERSION([STRING],[CLEANED_STRING])
#
# DESCRIPTION
#
#   Takes git version string format as:
#
#   MAJOR.MINOR.MICRO-GIT_COMMIT_NUMBER-GIT_SHA1-EXTRA
#
#   removes GIT_COMMIT_NUMBER and GIT_SHA1 returning as CLEANED_STRING.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#   Copyright (c) 2009 Alessandro Massignan <ff0000.it@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AC_DEFUN([AX_GIT_VERSION],[
    AC_REQUIRE([AC_PROG_SED])

    AS_IF([test -n "$2"],[
        AC_MSG_CHECKING([version $1])
        $2=`echo $1 | sed -n 's/^\([[^\.\-]][[^\.\-]]*\)\(\.[[^\.\-]][[^\.\-]]*\)\?\(\.[[^\.\-]][[^\.\-]]*\)\?\.[[0-9]][[0-9]]*\-[[0-9a-z]][[0-9a-z]]*\(\-.*\)$/\1\2\3\4/p;'`

        AS_IF([test -z $2],[
            $2=$1
        ])
        AC_MSG_RESULT([$$2])
    ])
])
