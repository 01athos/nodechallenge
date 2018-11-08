#!/bin/bash
host=`puppetserver ca list |grep -v Requested |cut -d" " -f5`
puppetserver ca sign --certname ${host}
