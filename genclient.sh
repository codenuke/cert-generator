
# Create the client-side certificates

OPENSSL_CLIENT=$1

openssl req -newkey rsa:2048 -days 3600 -nodes \
    -subj "${OPENSSL_CLIENT}" \
    -keyout ./certs/client-key.pem -out ./certs/client-req.pem

openssl rsa -in ./certs/client-key.pem -out ./certs/client-key.pem

openssl x509 -req -in ./certs/client-req.pem -days 3600 \
    -CA ./certs/root-ca.pem -CAkey ./certs/root-ca-key.pem \
    -set_serial 01 -out ./certs/client-cert.pem

# Verify the certificates are correct
openssl verify -CAfile ./certs/root-ca.pem ./certs/client-cert.pem
