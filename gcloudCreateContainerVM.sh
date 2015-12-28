gcloud compute instances create drone \
  --image "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1510-wily-v20151114" \
  --zone asia-east1-c \
  --machine-type n1-standard-1 \
  --boot-disk-size "50" \
  --boot-disk-type "pd-ssd" \
  --tags "http-server","https-server" \
  --network "default"
