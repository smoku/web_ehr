namespace :db do
  desc "Populate db"
  task :populate => :environment do
    
    20.times do |i|
      profile = Profile.new
      profile.name = Faker::Name.name
      profile.birth_date = range_rand(15,45).years.ago
      profile.blood_type = "A+"
      profile.gender = range_rand(0,1)
      
      10.times do |j|
        medication = profile.medications.build
        medication.name = ["Aspirin", "Vitaminum B"].shuffle.first
        medication.started_date = range_rand(1,5).months.ago
        medication.ended_date = medication.started_date + range_rand(10,30).days
        medication.strength = "500mg"
        medication.dose = "2 tablets"
        medication.frequency = "2 times a day"
        medication.note = Faker::Lorem.sentence(8)
      end
      
      10.times do |j|
        result = profile.results.build
        result.name = ["Cholesterol", "Hemoglobin"].shuffle.first
        result.result = range_rand(10,100).to_s
        result.units = "mmol"
        result.date = range_rand(1,45).days.ago
        result.note = Faker::Lorem.sentence(8)
      end
      
      profile.save
    end
    
  end
    
end

# helpers
def range_rand(min,max)
 min + rand(max + 1 - min)
end