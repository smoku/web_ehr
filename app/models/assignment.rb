class Assignment < ActiveRecord::Base
  # ================
  # = associations =
  # ================
  belongs_to :profile
  belongs_to :user
  
  
  
end
