class UsersController < ApplicationController
  
  def index
    @search = User.search(params[:search])
    @search.meta_sort ||= "created_at.desc"
    @users = @search.paginate :per_page => 20, :page => params[:page]
  end
  
end
