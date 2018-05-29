class Account < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :account_type, :presence => true

  validates :joint_owner_id, :uniqueness => { :scope => [:owner_id] }

  validates :name, :uniqueness => { :scope => [:owner_id] }

  validates :name, :presence => true

  validates :owner_id, :presence => true

end
