echo "172.25.65.85 ds1.capetown.gov.za" >> /etc/hosts

LC_ALL=C.UTF-8
LANG=C.UTF-8
/usr/bin/git clone $DBUTILS_URL

# loop
while [ 1 ]
do
# define folder name
  GIT_BASENAME="${GIT_URL##*/}"
  GIT_FOLDER="${GIT_BASENAME%.*}"
# move to root if not there already
  cd /
# kill mkdocs if it is alive
  pkill mkdocs
# remove git folder if it there already
  rm -rf $GIT_FOLDER
# clone it in again
  /usr/bin/git clone $GIT_URL
# move into git repo
  cd /$GIT_FOLDER
# run mkdocs build
  mkdocs build --clean
# push site folder to minio
  mkdocs serve -a 0.0.0.0:80 &
# sleep for 1 hour
  sleep 1h
done

