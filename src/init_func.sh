source vars

# There, are the functions used to initialize and install a Ceph cluster

ssh_setup(){
  ssh-keygen -t rsa -b 4096;

  for i in $node;do
    ssh-copy-id $ssh_user@node$i;
    echo "Host node$i
      Hostname node$i
      User $ssh_user" >> ~/.ssh/config;done;
}

#
# Initializes the cluster
#
cluster_init(){
  ceph-deploy new node1;
}

#
# installs the Ceph required packages on every node
#
cluster_install(){
  for i in $node;do
    ceph-deploy install node$i;
  done;
}

#
# Initializes the first monitor
#
init_mon(){
  ceph-deploy mon create-initial;
}

#
# put the keyring and so on on every node blablabla check the doc
# well, if you're lazy, just use this function
#
admin_deploy(){
  for i in $admin_node;do
    ceph-deploy admin node$i
  done;
}

#
# installs manager daemon on every desired node
#
mgr_deploy(){
  for i in $manager_node;do
    ceph-deploy mgr create node$i;
  done;
}

#
# initializes the first cluster's OSD
#
osd_init(){
  ceph-deploy osd create node1:$osd_disk;
}

#
# initializes the first metadata server of the cluster
#
msd_init(){
  ceph-deploy msd create node$mds_node
}
