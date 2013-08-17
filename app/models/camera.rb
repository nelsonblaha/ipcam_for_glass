class Camera < ActiveRecord::Base

  has_many :zones
  belongs_to :user

  def auth
    { username: self.username, password: self.password }
  end

  def toggle(active = nil)
    if !active.nil?
      data = active ? 0 : 1
    else
      data = self.privacy ? 0 : 1
    end

    message = self.name + " camera "
    status = (data == 1) ? "disabled." : "enabled."
    message << status

    self.user.notify(message)

    if HTTParty.get(self.url+"/Set?Func=Powerdown&Kind=1&Data="+data.to_s, basic_auth: self.auth)
      self.privacy = (data == 1) ? true : false
      self.save
    end
  end
end
