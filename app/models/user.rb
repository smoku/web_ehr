class User < ActiveRecord::Base
  attr_accessible :name, :surname, :email, :password, :password_confirmation, :remember_me
  
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  
  # ================
  # = associations =
  # ================
  has_many :assignments, :dependent => :destroy
  has_many :profiles, :through => :assignments, :readonly => false
  
  # ===============
  # = validations =
  # ===============
  validates :name, :surname, :presence => true
  
  
  def full_name
    "#{self.name} #{self.surname}"
  end
  
  def to_label
    self.full_name
  end
  
  
end
