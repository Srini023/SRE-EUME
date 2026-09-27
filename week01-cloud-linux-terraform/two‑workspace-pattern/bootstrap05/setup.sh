#!/bin/bash
set -e

BOOTSTRAP_DIR="bootstrap"
MAIN_DIR="main"

usage() {
  echo "Usage: $0 {aws|gcp}"
  exit 1
}

if [ $# -ne 1 ]; then
  usage
fi

CLOUD=$1

case "$CLOUD" in
  aws)
    echo "=== Step 1: Bootstrap AWS backend infrastructure ==="
    cd $BOOTSTRAP_DIR
    terraform init
    terraform apply -auto-approve

    echo "=== Step 2: Configure main workspace with AWS remote backend ==="
    cd ../$MAIN_DIR
    terraform init -reconfigure
    terraform apply -auto-approve
    ;;
  gcp)
    echo "=== Step 1: Bootstrap GCP backend infrastructure ==="
    cd $BOOTSTRAP_DIR
    terraform init
    terraform apply -auto-approve

    echo "=== Step 2: Configure main workspace with GCP remote backend ==="
    cd ../$MAIN_DIR
    terraform init -reconfigure
    terraform apply -auto-approve
    ;;
  *)
    usage
    ;;
esac

echo "=== Done: $CLOUD backend provisioned and main workspace applied ==="

