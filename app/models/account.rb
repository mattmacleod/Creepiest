class Account < ActiveRecord::Base
  
  # Relationships
  has_many :locations
  
  # Validations
  validates_uniqueness_of :name, :scope => :account_type
  validates :account_type, :inclusion => ["twitter"]
  
  def sync
    case account_type
    when "twitter"
      
      latest_location = locations.order(:remote_id).last
      latest_id = latest_location ? latest_location.remote_id : 1

      (1..16).each do |page|
        
        tweets = Twitter.user_timeline(name, :count => 200, :page => page, :trim_user => true, :since_id => latest_id)
        
        tweets.each do |tweet|
          if tweet.geo
            locations.create(
              :lat => tweet.geo.coordinates[0],
              :lng => tweet.geo.coordinates[1],
              :location_time => Time::parse(tweet.created_at),
              :remote_id => tweet.id_str
            )
          end
        end
        break if tweets.length == 0
      end
      
      update_attribute(:synced_at, Time::now)
      
    end
  end
  
end
