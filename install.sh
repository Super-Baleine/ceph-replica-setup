#!/usr/bin/env bash


#how to copy some lines from the ceph doc...
#yea... i'm lazy | but it might work fine so we don't care lol
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian/ jessie main | sudo tee /etc/apt/sources.list.d/ceph.list

apt-get update && apt-get install ceph-deploy

source init_func.sh;
source setup_func.sh

#
## I'M ONE CALL AWAAAAY ~
ssh_setup;
cluster_init;
cluster_install;
init_mon;
admin_deploy;
mgr_deploy;
osd_init;
msd_init;
mon_setup;
add_osd;
#
