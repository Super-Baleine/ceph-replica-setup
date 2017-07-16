ssh_user="toto"
node="1 2 3" #all the nodes of the cluster
mon_node="1" #nodes you want to put as monitor
admin_node="1 2 3" #nodes you want to put as admin node - useful to avoid typing monitors' address and to avoid giving the client admin keyring
osd_node"1"
osd_node_postinstall="2 3"
osd_disk="sdb" #disk to use on every data node (OSD node)
#or also: osd_disk="/path/to/the/directory/you/wanna/"
mds_node="1" #Ceph doesn't recommend to use more than one metadata node for prod' environements
manager_node="1" #it's recommended to use every monitor server as a maanger one too
mon_node_postinit="2 3"
