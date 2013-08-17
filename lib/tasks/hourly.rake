desc "Update user access tokens"
task :hourly => :environment do
  User.all.each do |user|
    begin
      user.refresh_access_token
    rescue
      puts "Couldn't refresh access token"
    end
  end
end