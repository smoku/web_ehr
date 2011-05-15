class Profile < ActiveRecord::Base
  # ================
  # = associations =
  # ================
  has_many :medications, :dependent => :destroy
  has_many :results, :dependent => :destroy
  
  # ===============
  # = validations =
  # ===============
  validates :name, :birth_date, :blood_type, :gender, :presence => true
end
