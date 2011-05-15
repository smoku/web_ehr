class Api::MedicationsController < Api::BaseController
  before_filter :find_profile
  
  def create
    @medication = @profile.medications.build(params[:medication])

    if @medication.save
      render :json => @medication, :status => :created, :location => @medication
    else
      render :json => @medication.errors.full_messages, :status => :unprocessable_entity
    end
  end
  
  def destroy
    @medication = @profile.medications.find(params[:id])
    @medication.destroy
    
    head :ok
  end
  
  private
  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
