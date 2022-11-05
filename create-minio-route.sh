oc create route passthrough --namespace minio-ns --service=minio --port=minio-console
oc create route passthrough --namespace minio-ns --service=minio-api --port=minio
