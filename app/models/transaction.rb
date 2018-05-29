class Transaction < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :date, :presence => true

  validates :trasaction_type, :presence => true

end
