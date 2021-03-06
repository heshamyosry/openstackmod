#!/bin/sh

# Copyright 2012 Anton Beloglazov
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#prepare CentOS env.

# Flush the iptables rules. For production it is recommended to open
# the specific required ports.
iptables -F

# Save the configuration and restart iptables
service iptables save
service iptables restart

yum update -y
yum install openssh-server openssh-clients wget fuse fuse-libs libibverbs openssh-server ntp http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm -y
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
echo 0 > /selinux/enforce