#!/bin/bash

# Variables that can be changed
STOREPASS="latihan"
KEYPASS="latihan"
ALIAS_CA="ca"
ALIAS_KEYSTORE="client"
KEYSTORE_NAME="client.ks.p12"
TRUSTSTORE_NAME="client.ts.p12"
CN="localhost"
CSR_NAME="client.csr"
CRT_NAME="client.crt"
IP_ADDR_1="172.18.46.30"
IP_ADDR_2="172.18.46.31"
IP_ADDR_3="172.18.46.32"




#step 1 import server ca into trusstore client 

keytool -import -file ../server.ca.crt -keystore "$TRUSTSTORE_NAME" \
-storetype PKCS12 -storepass "$STOREPASS" -alias "$ALIAS_CA" -noprompt


# Step 2: Create keystore and certificate request to be signed by CA
keytool -genkey -keyalg RSA -keysize 2048 -keystore "$KEYSTORE_NAME" \
-storepass "$STOREPASS" -keypass "$KEYPASS" -alias "$ALIAS_KEYSTORE" \
-storetype PKCS12 -dname "CN='$CN',O=AllData,C=ID" -validity 365

# Cert req to be signed
keytool -certreq -file "$CSR_NAME" -keystore "$KEYSTORE_NAME" -storetype PKCS12 \
-storepass "$STOREPASS" -keypass "$KEYPASS" -alias "$ALIAS_KEYSTORE"

keytool -gencert -infile "$CSR_NAME" -outfile "$CRT_NAME" \
-keystore ../server.ca.p12 -storetype PKCS12 -storepass "$STOREPASS" \
-alias "$ALIAS_CA" -ext SAN=IP:"$IP_ADDR_1",IP:"$IP_ADDR_2",IP:"$IP_ADDR_3" -validity 365

# Concatenate files for simplicity
cat "$CRT_NAME" ../server.ca.crt > clientchain.crt

# Import concatenated certificate chain to keystore
keytool -importcert -file clientchain.crt -keystore "$KEYSTORE_NAME" \
-storepass "$STOREPASS" -keypass "$KEYPASS" -alias "$ALIAS_KEYSTORE" \
-storetype PKCS12 -noprompt


