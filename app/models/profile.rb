class Profile < ActiveRecord::Base
  GENDERS = {0 => "Male", 1 => "Female"}
  BLOOD_TYPES = ["A+", "B+", "AB+", "0+", "A-", "B-", "AB-", "0-"]
  
  # ================
  # = associations =
  # ================
  has_many :medications, :dependent => :destroy
  has_many :results, :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  has_many :users, :through => :assignments
  
  # ===============
  # = validations =
  # ===============
  validates :name, :birth_date, :blood_type, :gender, :presence => true
  
  def gender_name
    GENDERS[self.gender]
  end
  
end
