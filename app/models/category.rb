class Category < ApplicationRecord
  # Direct associations

  has_many   :transactions

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
