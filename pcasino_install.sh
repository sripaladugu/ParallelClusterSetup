#!/bin/bash
. "/etc/parallelcluster/cfnconfig"

sudo yum check-update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 666 /var/run/docker.sock

if [ "${cfn_node_type}" = "MasterServer" ]; then
    sudo yum -y install java-1.8.0-openjdk
    sudo wget -qO- https://get.nextflow.io | bash
    sudo mv nextflow /usr/local/bin
    sudo chmod 755 /usr/local/bin/nextflow
    sudo yum -y install graphviz
    sudo mkdir -p /apps/cromwell
    sudo wget https://github.com/broadinstitute/cromwell/releases/download/53.1/cromwell-53.1.jar -P /apps/cromwell/
    sudo wget https://github.com/broadinstitute/cromwell/releases/download/53.1/womtool-53.1.jar -P /apps/cromwell/
fi
