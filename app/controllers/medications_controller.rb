class MedicationsController < ApplicationController
  before_filter :find_parent_resource
  before_filter :find_resource, :only => [:edit, :update, :destroy]

  def index
    @search = @profile.medications.search(params[:search])
    @search.meta_sort ||= "created_at.desc"
    @medications = @search.paginate :per_page => 20, :page => params[:page]
  end

  def new
    @medication = @profile.medications.build
  end

  def create
    @medication = @profile.medications.build(params[:medication])
    
    if @medication.save
      flash[:notice] = "Medication was successfully created"
      redirect_to profile_medications_path(@profile)
    else
      render :action => "new"
    end
  end

  def edit
    @profile = @medication.profile
  end
  
  def update
    @profile = @medication.profile
    
    if @medication.update_attributes(params[:medication])
      flash[:notice] = "Medication was successfully updated"
      redirect_to profile_medications_path(@profile)
    else
      render :action => "edit"
    end
  end

  def destroy
    @medication.destroy
    
    flash[:notice] = "Medication was successfully deleted"
    redirect_to profile_medications_path(@medication.profile)
  end
  
  private
  def find_parent_resource
    @profile = current_user.profiles.find(params[:profile_id])
  end
  
  def find_resource
    @medication = @profile.medications.find(params[:id])
  end
end
