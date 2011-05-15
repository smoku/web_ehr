class Api::ProfilesController < Api::BaseController
  
  def index
    @profiles = Profile.includes([:medications, :results]).all
    
    # Configure json output
    profile_fields = [:id, :name, :birth_date, :blood_type, :gender]
    medication_fields = [:id, :name, :started_date, :ended_date, :strength, :route, :dose, :frequency, :note]
    result_fields = [:id, :name, :result, :units, :date, :note]
    
    json_config = {:only => profile_fields, 
                   :include => {
                     :medications => {:only => medication_fields}, 
                     :results => {:only => result_fields} 
                     }
                  } 
    
    render :json => @profiles.to_json(json_config)
  end
  
end
