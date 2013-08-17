class User < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  validates_presence_of :name

  has_many :cameras
  has_many :zones

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def refresh_access_token
    self.access_token = HTTParty.post('https://accounts.google.com/o/oauth2/token', :body => {refresh_token: self.refresh_token, client_id: GOOGLE_KEY, client_secret: GOOGLE_SECRET, grant_type:'refresh_token'})['access_token']
    self.save
  end

  def notify(text)
    require "mirror-api"
    api = Mirror::Api::Client.new(self.access_token)
    if self.mirror_card_id
      api.timeline.update(self.mirror_card_id,{text:text,notification:{level:'DEFAULT'},menuItems:[{action:"DELETE"},{action:"TOGGLE_PINNED"}]})
    else
      self.mirror_card_id = api.timeline.insert({text:text,notification:{level:'DEFAULT'},menuItems:[{action:"DELETE"},{action:"TOGGLE_PINNED"}]}).id
      self.save
    end 
  end

  def location
    require "mirror-api"
    api = Mirror::Api::Client.new(self.access_token)
    if location = api.locations.list.items.first
      self.latitude = location.latitude
      self.longitude = location.longitude
      self.save
      return [location.latitude,location.longitude,location.accuracy]
    end
  end

end
