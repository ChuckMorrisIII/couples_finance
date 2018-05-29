class Transaction < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :amount, :numericality => true

  validates :category_id, :presence => true

  validates :date, :presence => true

  validates :trasaction_type, :presence => true

end
