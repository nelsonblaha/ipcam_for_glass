desc "Process zones"
task :refresh_zones => :environment do
  Zone.all.each do |zone|
    begin
      zone.check
    rescue
      puts "couldn't check a zone"
    end
  end
end