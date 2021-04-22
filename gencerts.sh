
mkdir -p certs

OPENSSL_SUBJ="/C=TH/ST=Bangkok/L=Bangkok"
OPENSSL_CA="${OPENSSL_SUBJ}/CN=CA"
OPENSSL_SERVER="${OPENSSL_SUBJ}/CN=SERVER"
OPENSSL_CLIENT="${OPENSSL_SUBJ}/CN=CLIENT"

sh ./genroot.sh "${OPENSSL_CA}"
sh ./genserver.sh "${OPENSSL_SERVER}"
sh ./genclient.sh "${OPENSSL_CLIENT}"

