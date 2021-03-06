class Api::MedicationsController < Api::BaseController
  before_filter :find_profile
  
  def create
    @medication = @profile.medications.build(params[:medication])

    if @medication.save
      render :json => @medication, :status => :created
    else
      render :json => {:errors => @medication.errors.full_messages}, :status => :unprocessable_entity
    end
  end
  
  def destroy
    @medication = @profile.medications.find(params[:id])
    @medication.destroy
    
    head :ok
  end
  
  private
  def find_profile
    @profile = current_user.profiles.find(params[:profile_id])
  end
end
