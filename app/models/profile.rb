class Profile < ActiveRecord::Base
  # ================
  # = associations =
  # ================
  has_many :medications, :dependent => :destroy
  has_many :results, :dependent => :destroy
  
end
