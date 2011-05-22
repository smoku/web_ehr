class ResultsController < ApplicationController
  before_filter :find_parent_resource
  before_filter :find_resource, :only => [:edit, :update, :destroy]

  def index
    @search = @profile.results.search(params[:search])
    @search.meta_sort ||= "created_at.desc"
    @results = @search.paginate :per_page => 20, :page => params[:page]
  end

  def new
    @result = @profile.results.build
  end

  def create
    @result = @profile.results.build(params[:result])
    
    if @result.save
      flash[:notice] = "Result was successfully created"
      redirect_to profile_results_path(@profile)
    else
      render :action => "new"
    end
  end

  def edit
    @profile = @result.profile
  end
  
  def update
    @profile = @result.profile
    
    if @result.update_attributes(params[:result])
      flash[:notice] = "Result was successfully updated"
      redirect_to profile_results_path(@profile)
    else
      render :action => "edit"
    end
  end

  def destroy
    @result.destroy
    
    flash[:notice] = "Result was successfully deleted"
    redirect_to profile_results_path(@result.profile)
  end
  
  private
  def find_parent_resource
    @profile = current_user.profiles.find(params[:profile_id])
  end
  
  def find_resource
    @result = @profile.results.find(params[:id])
  end
  
end
