# How to use
## clone this repository
```
$ git clone https://github.com/siu-issiki/docker-crowi
```

## write .env
```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=
bucket=
```

## write backup/crontab
exmaple
```
02 03 * * * /bin/sh /s3_dump_upload.sh
```

## server start
```
$ docker-compose up -d
```

# when restore dump file
## locate your dump
example
```
$ mv ~/downloads/crowi.dump ~/crowi-docker/backup/crowi.dump
```

## mount dump file to backup container
example
```
~~~
volumes:
  - ./backup/mongodb.repo:/etc/yum.repos.d/mongodb.repo
  - ./backup/s3_dump_upload.sh:/s3_dump_upload.sh
  - ./backup/crontab:/var/spool/cron/crontabs/root
  - ./backup/crowi.dump:/crowi.dump
~~~
```

## mongorestore on backup container
example
```
$ docker-compose run backup mongorestore --host db --port 27017 -d crowi --dir crowi.dump/crowi
```