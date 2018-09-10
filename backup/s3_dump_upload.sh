#!/bin/bash

dir=`date '+%Y-%m'`
date=`date '+%Y%m%d'`
mongodump --host db --port 27017 -d crowi -o crowi.dump
zip crowi_dump -r crowi.dump
aws s3 cp crowi_dump.zip s3://$bucket/crowi/$dir/$date --storage-class REDUCED_REDUNDANCY