class Transaction < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :required => false

  belongs_to :account

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :account_id, :presence => true

  validates :amount, :presence => true

  validates :amount, :numericality => true

  validates :category_id, :presence => true

  validates :date, :presence => true

  validates :trasaction_type, :presence => true

end
