#!/bin/bash

thingName="b7b6a3b8-a8c3-4d8b-956a-1b273254081f"
iotRoleAlias="webrtc-camera-certificate-based-role-alias"
iotCert="webrtc_iot_certificate.pem"
iotPrivateKey="webrtc_iot_private.key"
iotCaCert="cacert.pem"  # curl --silent 'https://www.amazontrust.com/repository/SFSRootCAG2.pem' --output cacert.pem

export DEBUG_LOG_LEVEL_ENV_VAR=1
export AWS_IOT_CORE_CREDENTIAL_ENDPOINT="c15ue5suwn6ycw.credentials.iot.us-west-2.amazonaws.com"
export AWS_IOT_CORE_CERT=$iotCert
export AWS_IOT_CORE_PRIVATE_KEY=$iotPrivateKey
export AWS_IOT_CORE_ROLE_ALIAS=$iotRoleAlias
export AWS_IOT_CORE_THING_NAME=$thingName
export CACERT_PATH_ENV_VAR=$iotCaCert

./kvsWebrtcClientMaster
