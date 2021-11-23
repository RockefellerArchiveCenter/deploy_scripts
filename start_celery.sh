#!/bin/bash
set -e

# restart apache
sudo supervisorctl restart celery celerybeat
