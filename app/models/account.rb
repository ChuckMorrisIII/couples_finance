class Account < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :joint_owner_id, :uniqueness => { :scope => [:owner_id] }

  validates :name, :uniqueness => { :scope => [:owner_id] }

  validates :name, :presence => true

  validates :owner_id, :presence => true

end
