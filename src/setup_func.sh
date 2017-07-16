source vars.sh
#
# add the desired node as monitor
# post-install
mon_setup(){
  for i in $mon_node_postinit;do
    ceph-deploy mon add node$i;
  done;
}

#
# add the other nodes as OSD
#
add_osd(){
  for i in $osd_node_postinstall;do
    ceph-deploy osd add node$i:$osd_disk;
  done;
}

#
# sets up the Ceph file system
#
create_pool_fs(){
  pg=256;
  md_name="cephfs_metadata";
  data_name="cephfs_data";
  filesystem_name="cephfs"
  ssh node1 "ceph osd pool create $md_name $pg";
  ssh node1 "ceph osd pool create $data_name $pg";
  ceph fs new $filesystem_name $md_name $data_name;
}
