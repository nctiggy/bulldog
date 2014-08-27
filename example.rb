require_relative 'bulldog.rb'
require 'pp'

#Create new object
bulldog = Bulldog.new('https://10.4.45.77','admin','Xtrem10',FALSE)

#Grab the first queried volume's name
vol_name = bulldog.get_volumes['volumes'][0]['name']

snap_href = bulldog.create_snapshot("snap_#{vol_name}",vol_name)['links'][0]['href']

bulldog.get_snapshot(snap_href)

bulldog.delete_snapshot(snap_href)