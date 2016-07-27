#!/bin/bash
set -e
ssh_options='-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
BASEDIR=`dirname $0`
INSTALLER_IP=${INSTALLER_IP:-10.20.0.2}

ip=`sshpass -p r00tme ssh $ssh_options root@10.20.0.2 'fuel node'|grep controller|awk '{print $10}' | head -1`
echo $ip
sshpass -p r00tme scp set-up-tacker.sh ${INSTALLER_IP}:/root
sshpass -p r00tme ssh $ssh_options root@${INSTALLER_IP} 'scp set-up-tacker.sh '"$ip"':/root'
sshpass -p r00tme ssh $ssh_options root@${INSTALLER_IP} 'ssh root@'"$ip"' bash set-up-tacker.sh'
sshpass -p r00tme ssh $ssh_options root@${INSTALLER_IP} 'scp '"$ip"':/root/tackerc .'
sshpass -p r00tme scp ${INSTALLER_IP}:/root/tackerc $BASEDIR
