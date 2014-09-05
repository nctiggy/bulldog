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
  
  def create_snapshot(new_vol,anc_vol)
    
    payload = {
      :'ancestor-vol-id' => anc_vol,
      :'snap-vol-name' => new_vol
    }
    
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
  
  def map_lun(vol_name,init_grp_name)
    payload = {
      :'vol-id' => vol_name,
      :'ig-id' => init_grp_name
    }
    
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