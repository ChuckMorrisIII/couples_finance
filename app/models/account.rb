class Account < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:owner_id] }

  validates :name, :presence => true

  validates :owner_id, :presence => true

end
