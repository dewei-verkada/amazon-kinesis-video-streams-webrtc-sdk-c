#!/bin/bash

# Recompile
pushd ../build/ && make && popd
cp ../build/samples/kvsWebrtcClientMaster .

# Set variables here
thingName="00000000-0000-0000-0000-000000000000" # IoT thing name (this should usually be the cameraID)
iotRoleAlias="webrtc-camera-certificate-based-role-alias" # IoT role alias name that enables certificate-based authentication
iotCert="webrtc_iot_certificate.pem" # device certificate terraform output certificate_pem
iotPrivateKey="webrtc_iot_private.key" # device private key from terraform output private_key
iotCaCert="cacert.pem"  # curl --silent 'https://www.amazontrust.com/repository/SFSRootCAG2.pem' --output cacert.pem

export DEBUG_LOG_LEVEL_ENV_VAR=1
export AWS_IOT_CORE_CREDENTIAL_ENDPOINT="c3anqgx5shvtc.credentials.iot.us-west-2.amazonaws.com" # aws --profile staging-sandbox iot describe-endpoint --endpoint-type iot:CredentialProvider --output text
export AWS_IOT_CORE_CERT=$iotCert
export AWS_IOT_CORE_PRIVATE_KEY=$iotPrivateKey
export AWS_IOT_CORE_ROLE_ALIAS=$iotRoleAlias
export AWS_IOT_CORE_THING_NAME=$thingName
export CACERT_PATH_ENV_VAR=$iotCaCert

./kvsWebrtcClientMaster

