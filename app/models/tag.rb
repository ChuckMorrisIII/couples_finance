class Tag < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  has_many   :tagged_transactions,
             :through => :taggings,
             :source => :tagged_transaction

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
