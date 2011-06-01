class Api::ResultsController < Api::BaseController
  before_filter :find_profile
  
  def create
    @result = @profile.results.build(params[:result])

    if @result.save
      render :json => @result, :status => :created
    else
      render :json => {:errors => @result.errors.full_messages}, :status => :unprocessable_entity
    end
  end
  
  def destroy
    @result = @profile.results.find(params[:id])
    @result.destroy
    
    head :ok
  end
  
  private
  def find_profile
    @profile = current_user.profiles.find(params[:profile_id])
  end
end
