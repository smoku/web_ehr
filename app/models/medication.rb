class Medication < ActiveRecord::Base
  # ================
  # = associations =
  # ================
  belongs_to :profile

end
