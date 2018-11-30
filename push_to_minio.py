import os

GIT_URL = os.environ.get("GIT_URL", None)
DBUTILS_URL = os.environ.get("DBUTILS_URL", None)
print(GIT_URL)
print(DBUTILS_URL)

folder = '/' + os.path.splitext(os.path.basename(GIT_URL))[0] + '/site'


