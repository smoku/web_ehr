class AccountsController < ApplicationController
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def edit_password
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = (params[:password].present? ? "Password has been changed" : "Account was successfully updated")
      redirect_to account_path
    else
      render :action => (params[:password].present? ? "edit_password" : "edit")
    end
  end
  
  
end
