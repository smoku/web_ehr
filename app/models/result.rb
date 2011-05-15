class Result < ActiveRecord::Base
  # ================
  # = associations =
  # ================
  belongs_to :profile
  
  
  # ===============
  # = validations =
  # ===============
  validates :name, :result, :units, :date, :presence => true
end
