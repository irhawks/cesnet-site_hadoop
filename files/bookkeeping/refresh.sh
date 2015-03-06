#! /bin/sh -e

KRB5CCNAME='FILE:/tmp/krb5cc_hadoop_bookeeping'
KEYTAB='FILE:/etc/security/keytab/nn.service.keytab'
PRINCIPAL="nn/`hostname -f`"

if test -f ${DEFAULTDIR}/hadoop-bookkeeping; then
 . ${DEFAULTDIR}/hadoop-bookkeeping
fi
export KRB5CCNAME

if test -n "${PRINCIPAL}"; then
  kinit -k -t ${KEYTAB} ${PRINCIPAL}
fi
