#!/bin/bash
awk '{print "HTTP/1.1 " $9}' /var/log/nginx/access.log | sort | uniq -c | sort -rn > /tmp/accesslog_results.txt
