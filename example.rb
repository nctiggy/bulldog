require_relative 'lib/heybulldog.rb'
require 'pp'

#Create new object
bulldog = Bulldog.new('https://10.4.45.77','admin','Xtrem10',FALSE)

#Grab the first queried volume's name
vol_name = bulldog.get_volumes['volumes'][0]['name']

#create the Snap
snap_href = bulldog.create_snapshot("snap_#{vol_name}",vol_name)['links'][0]['href']

#Get the Snap Details
snap = bulldog.get_snapshot(snap_href)

#Get all the initiator groups (in this case)
ig = bulldog.get_initiator_groups

#Map new volume to all initiator groups
ig["initiator-groups"].each do |host|
  bulldog.map_lun(snap['content']['name'],host['name'])
end

#print out naa-name (what the host should see)
pp bulldog.get_volume_by_id(snap['content']['index'])['content']['naa-name']

#delete snapshot
bulldog.delete_snapshot(snap_href)