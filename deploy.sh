echo "172.25.65.85 ds1.capetown.gov.za" >> /etc/hosts

LC_ALL=C.UTF-8
LANG=C.UTF-8

/usr/bin/git clone $GIT_URL
/usr/bin/git clone $DBUTILS_URL

GIT_BASENAME="${GIT_URL##*/}"
GIT_FOLDER="${GIT_BASENAME%.*}"

echo ifconfig

# move into git repo
cd /$GIT_FOLDER
# run mkdocs build
mkdocs build --clean
# push site folder to minio
mkdocs serve -a 0.0.0.0:80
