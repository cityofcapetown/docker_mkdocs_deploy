# docker_mkdocs_deploy
This container will pull a mkdocs folder from a git repo, build it into a static site, and then push the site to a minio bucket.

# Example of a docker run command

```
docker run --rm -it \
-e GIT_REPO=https://ds1.capetown.gov.za/ds_gitlab/OPM/ds_zone_documentation.git \
-p 80:80 \
--name mkdocs \
cityofcapetown/docker_mkdocs_deploy 

```

# Expectations

The container expects the GIT_REPO to point to a mkdocs project folder (i.e a folder with mkdocs.yaml and a docs folder with .md files). See https://www.mkdocs.org/

# Different behaviours

The standard command above will clone the `GIT_REPO`, convert the contenxt to a static site, and serve it at port 8000. It will refresh the website every hour.

You can change the behaviour by telling docker to use a different script, like so - 


```
docker run --rm -it \
-e GIT_REPO=https://ds1.capetown.gov.za/ds_gitlab/OPM/ds_zone_documentation.git \
-p 80:80 \
--name mkdocs \
cityofcapetown/docker_mkdocs_deploy \
/deploy.sh
```

Available scripts are 

`serve.sh` - default  
`deploy.sh` - clone in a repo, convert to static site, send site contents of site to bucket [not implemented yet]



