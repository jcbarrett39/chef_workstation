#
# Cookbook:: workstation
# Recipe:: setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

puts "***** THIS IS THE START OF THE WORKSTATION::SETUP RECIPE   ***********"
puts "IPADDRESS is #{node['ipaddress']}"

package 'tree' do
  action :install
end

#Note the default action for a package is :install
package 'nano'

package 'vim'

package 'git'

package 'ntp'

file '/etc/motd' do
  content 'This server is the property of 39mcc
  '
  action :create
  owner 'root'
  group 'root'
end

service 'ntpd' do
  action [ :enable, :start ]
end

cookbook_file '/etc/chef-example-cookbook_file' do
  source 'chef-example-cookbook_file'
end


user 'ebanks' do
  comment 'Ernie Banks'
  uid '144'
  shell '/bin/bash'
end

group 'engineers' do
  members 'ebanks'
  append true
end
