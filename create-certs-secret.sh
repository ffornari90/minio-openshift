mkdir -p certs
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -sha256 -keyout certs/private.key -out certs/public.crt -subj "/CN=minio-0" \
-addext "subjectAltName = DNS:minio.minio-ns.svc, DNS:minio-minio-ns.apps.cnsa.cr.cnaf.infn.it, DNS:minio-0, DNS:minio-api-minio-ns.apps.cnsa.cr.cnaf.infn.it"
cp certs/public.crt certs/ca.crt
kubectl create secret generic tls-ssl-minio -n minio-ns --from-file=./certs/private.key --from-file=./certs/public.crt --from-file=./certs/ca.crt
