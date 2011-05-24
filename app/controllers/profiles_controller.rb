class ProfilesController < ApplicationController
  before_filter :find_resource, :only => [:edit, :update, :destroy]
  before_filter :assign_current_user, :only => [:create, :update]
  
  def index
    @search = current_user.profiles.search(params[:search])
    @search.meta_sort ||= "name.desc"
    @profiles = @search.paginate :per_page => 20, :page => params[:page]
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @profile = current_user.profiles.build
  end

  def create
    @profile = current_user.profiles.build(params[:profile])
    if @profile.save
      flash[:notice] = "Profile was successfully created"
      redirect_to profile_medications_path(@profile)
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Profile was successfully updated"
      redirect_to profile_medications_path(@profile)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @profile.destroy
    
    flash[:notice] = "Profile was successfully deleted"
    redirect_to profiles_path
  end
  
  private
  def find_resource
    @profile = current_user.profiles.find(params[:id])
  end
  
  def assign_current_user
    params[:profile][:user_ids] ||= []
    params[:profile][:user_ids] << current_user.id
  end
end
