# creating and deleting cluster.

export PROJECT_ID=${PROJECT_ID:-jianfeih-test}
export ZONE={ZONE:-us-west1}
export CLUSTER_NAME=${CLUSTER_NAME:-istio-dev}
DISK_SIZE=${DISK_SIZE:-64}
MACHINE_TYPE=${MACHINE_TYPE:-n1-standard-32}
MIN_NODES=${MIN_NODES:-"5"}
MAX_NODES=${MAX_NODES:-"20"}
IMAGE=${IMAGE:-"COS"}
MAXPODS_PER_NODE=100
SCOPES="https://www.googleapis.com/auth/cloud-platform"
gcloud beta container \
--project "${PROJECT_ID}" \
clusters create "${CLUSTER_NAME}" \
--no-enable-basic-auth \
--issue-client-certificate \
--machine-type "${MACHINE_TYPE}" --image-type ${IMAGE} \
--disk-type "pd-standard" --disk-size "${DISK_SIZE}" \
--scopes "${SCOPES}" \
--num-nodes "${MIN_NODES}" --enable-autoscaling \
--min-nodes "${MIN_NODES}" --max-nodes "${MAX_NODES}" \
--max-pods-per-node "${MAXPODS_PER_NODE}" \
--enable-stackdriver-kubernetes \
--enable-ip-alias \
--metadata disable-legacy-endpoints=true \
--default-max-pods-per-node "${MAXPODS_PER_NODE}" \
--enable-network-policy \
--enable-autoupgrade \
--enable-autorepair