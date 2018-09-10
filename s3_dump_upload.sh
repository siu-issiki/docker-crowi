mongodump --host db --port 27017 -d crowi -o crowi.dump
zip crowi_dump -r crowi.dump
aws s3 cp crowi_dump.zip s3://spectra-inc/crowi/ --storage-class REDUCED_REDUNDANCY