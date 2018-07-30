#!/bin/bash
ls /
/usr/bin/redis-server
exec "$@"