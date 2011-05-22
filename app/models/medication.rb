class Medication < ActiveRecord::Base
  ROUTES = ["By mouth", "Injection", "Inhaled", "To eyes", "To skin", "To nose"]
  DOSES = ["1/4", "1/2", "1", "2", "3", "4", "5"]
  FREQUENCIES = ["1 time per day", "1 time per day in the morning", "1 time per day in the evening", "2 times per day", "3 times per day", "4 times per day", "every hour"]
  
  # ================
  # = associations =
  # ================
  belongs_to :profile
  
  # ===============
  # = validations =
  # ===============
  validates :name, :started_date, :ended_date, :route, :strength, :dose, :frequency, :presence => true
  
end