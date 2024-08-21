#!/usr/bin/env bash
REG_TOKEN=$(curl -sX POST -H "Authorization: token ${pat}" https://api.github.com/repos/${repo}/actions/runners/registration-token | jq .token --raw-output)

echo "Token: ${REG_TOKEN}"

./config.sh --url https://github.com/${repo} --token ${REG_TOKEN} --labels self-hosted-ubuntu-2204

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!