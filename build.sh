#!/bin/sh

docker build --secret id=password,src=.password -t base ./base
docker build -t rust ./rust
