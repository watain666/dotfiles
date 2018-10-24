#!/usr/bin/env bash

cd $(dirname $0)
rsync -avp ./home/ ~/
