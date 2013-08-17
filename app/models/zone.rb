class Zone < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  belongs_to :camera
  belongs_to :user

  def check
    
    self.user.location
    distance = self.distance_to(self.user,:km) * 1000

    # unless presence matches active status
    unless (distance < self.radius) == self.triggered 
      if distance < self.radius
        self.camera.toggle(false)
      else
        self.camera.toggle(true)
      end
      self.triggered = (distance < self.radius)
      self.save
    end
  end
end
