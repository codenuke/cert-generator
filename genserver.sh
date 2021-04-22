
# Create the server-side certificates
OPENSSL_SERVER=$1

openssl req -newkey rsa:2048 -days 3600 -nodes \
    -subj "${OPENSSL_SERVER}" \
    -keyout ./certs/server-key.pem -out ./certs/server-req.pem

openssl rsa -in ./certs/server-key.pem -out ./certs/server-key.pem

openssl x509 -req -in ./certs/server-req.pem -days 3600 \
    -CA ./certs/root-ca.pem -CAkey ./certs/root-ca-key.pem \
    -set_serial 01 -out ./certs/server-cert.pem

# Verify the certificates are correct
openssl verify -CAfile ./certs/root-ca.pem ./certs/server-cert.pem
