class Tagging < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :tagged_transaction,
             :class_name => "Transaction",
             :foreign_key => "transaction_id"

  # Indirect associations

  # Validations

end
