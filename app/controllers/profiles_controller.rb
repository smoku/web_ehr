class ProfilesController < ApplicationController
  
  def index
    @profiles = Profile.includes([:medications, :results]).all
    
    @profiles_data = @profiles.map do |profile|
      profile_data = {}
      profile_data[:id] = profile.id
      profile_data[:name] = profile.name
      profile_data[:birth_date] = profile.birth_date
      profile_data[:blood_type] = profile.blood_type
      profile_data[:gender] = profile.gender
      profile_data[:medications] = profile.medications.map do |medication|
        medication_data = {}
        medication_data[:id] = medication.id
        medication_data[:name] = medication.name
        medication_data[:started_date] = medication.started_date
        medication_data[:ended_date] = medication.ended_date
        medication_data[:strength] = medication.strength
        medication_data[:dose] = medication.dose
        medication_data[:frequency] = medication.frequency
        medication_data[:note] = medication.note
        medication_data
      end
      profile_data[:results] = profile.results.map do |result|
        result_data = {}
        result_data[:id] = result.id
        result_data[:name] = result.name
        result_data[:result] = result.result
        result_data[:units] = result.units
        result_data[:date] = result.date
        result_data[:note] = result.note
        result_data
      end
      profile_data
    end
    
    render :json => @profiles_data.to_json
  end
  
end
