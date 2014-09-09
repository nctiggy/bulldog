require 'json'
require 'rest-client'

class Bulldog
  attr_accessor :user_name, :password, :base_url, :verify_cert
  
  def initialize(base_url,user_name,password,verify_cert)
    @verify_cert = to_boolean(verify_cert)
    @user_name = user_name
    @password = password
    @base_url = base_url
  end
  
  # Get all Clusters
  #
  # @return [JSON] returns a JSON collection of all Clusters HREF and Name information
  # @author Craig J Smith
  def get_clusters
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/clusters",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  # Get cluster deatils
  #
  # @return [JSON] returns a JSON collection of cluster details
  # @author Craig J Smith
  def get_cluster(cluster_href)
    JSON.parse(RestClient::Request.execute(method: :get,
      url: cluster_href,
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  # Get all X-Bricks
  #
  # @return [JSON] returns a JSON collection of all X-Bricks HREF and Name information
  # @author Craig J Smith
  def get_xbricks
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/bricks",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  # Get X-Brick deatils
  #
  # @return [JSON] returns a JSON collection of X-Brick details
  # @author Craig J Smith
  def get_xbrick(xbrick_href)
    JSON.parse(RestClient::Request.execute(method: :get,
      url: xbrick_href,
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  # Get all Volumes and Snapshots
  #
  # @return [JSON] returns a JSON collection of all Volume HREF and Name information
  # @author Craig J Smith
  def get_volumes
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/volumes",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  # Get an individual volumes's details
  #
  # @param vol_href [STRING] HREF value of a volume
  # @return [JSON] returns detailed volume information
  # @author Craig J Smith
  def get_volume(vol_href)
    JSON.parse(RestClient::Request.execute(method: :get,
      url: vol_href,
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def get_volume_by_id(vol_id)
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/volumes/#{vol_id}",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def get_snapshot(snap_href)
    JSON.parse(RestClient::Request.execute(method: :get,
      url: snap_href,
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def get_snapshots
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/snapshots",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def create_snapshot(ancestor_vol_id,snap_vol_name,folder_id=nil)
    
    payload = {}
    args = method(__method__).parameters.map { |arg| arg[1] }
    args.map.each do |arg| 
      payload[arg.to_s.gsub(/_/,'-')] = eval arg.to_s unless (eval arg.to_s).nil?
    end
    
     JSON.parse(RestClient::Request.execute(method: :post,
       url: "#{@base_url}/api/json/types/snapshots",
       verify_ssl: @verify_cert,
       payload: payload.to_json,
       user: @user_name,
       password: @password,
       headers: {
         content_type: 'application/json',
         accept: :json
       }))
  end
  
  def create_snapshot_from_folder(source_folder_id,suffix,folder_id=nil)
    
    payload = {}
    args = method(__method__).parameters.map { |arg| arg[1] }
    args.map.each do |arg| 
      payload[arg.to_s.gsub(/_/,'-')] = eval arg.to_s unless (eval arg.to_s).nil?
    end
    
     JSON.parse(RestClient::Request.execute(method: :post,
       url: "#{@base_url}/api/json/types/snapshots",
       verify_ssl: @verify_cert,
       payload: payload.to_json,
       user: @user_name,
       password: @password,
       headers: {
         content_type: 'application/json',
         accept: :json
       }))
  end
  
  def delete_snapshot(snap_href)
    RestClient::Request.execute(method: :delete,
      url: snap_href,
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      )
  end
  
  def get_initiator_groups
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/initiator-groups",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def map_lun(vol_id,ig_id,lun=nil,tg_id=nil)

    payload = {}
    args = method(__method__).parameters.map { |arg| arg[1] }
    args.map.each do |arg| 
      payload[arg.to_s.gsub(/_/,'-')] = eval arg.to_s unless (eval arg.to_s).nil?
    end
    
     JSON.parse(RestClient::Request.execute(method: :post,
       url: "#{@base_url}/api/json/types/lun-maps",
       verify_ssl: @verify_cert,
       payload: payload.to_json,
       user: @user_name,
       password: @password,
       headers: {
         content_type: 'application/json',
         accept: :json
       }))
  end
  
  def get_target_groups
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/target-groups",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def get_clusters
    JSON.parse(RestClient::Request.execute(method: :get,
      url: "#{@base_url}/api/json/types/clusters",
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def get_cluster(cluster_href)
    JSON.parse(RestClient::Request.execute(method: :get,
      url: cluster_href,
      headers: {
        accept: :json
      },
      verify_ssl: @verify_cert,
      user: @user_name,
      password: @password
      ))
  end
  
  def to_boolean(str)
    str.to_s.downcase == "true"
  end
end