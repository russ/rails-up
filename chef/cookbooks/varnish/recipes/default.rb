# Cookbook Name:: varnish
# Recipe:: default
# Author:: Joe Williams <joe@joetify.com>
#
# Copyright 2008-2009, Joe Williams
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
#

bash "Installing latest Varnish" do
  user "root"
  code <<-EOH
    curl http://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
    echo "deb http://repo.varnish-cache.org/ubuntu/ $(lsb_release -s -c) varnish-2.1" >> /etc/
    apt-get update
    apt-get install varnish
    /etc/init.d/varnish stop
  EOH
  not_if "apt-cache pkgnames | grep varnish | grep -v grep"
end
