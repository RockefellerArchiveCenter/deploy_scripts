#!/bin/bash
set -e

# restart apache
sudo supervisorctl start celery celerybeat
