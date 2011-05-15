class Medication < ActiveRecord::Base
  # ================
  # = associations =
  # ================
  belongs_to :profile
  
  # ===============
  # = validations =
  # ===============
  validates :name, :started_date, :ended_date, :route, :strength, :dose, :frequency, :presence => true
  
end
