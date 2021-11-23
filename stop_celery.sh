#!/bin/bash
set -e

# restart apache
sudo supervisorctl stop celery celerybeat
