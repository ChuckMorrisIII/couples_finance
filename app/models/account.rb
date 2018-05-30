class Account < ApplicationRecord
  # Direct associations

  has_many   :transactions,
             :dependent => :destroy

  belongs_to :joint_owner,
             :required => false,
             :class_name => "User"

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :account_type, :presence => true

  validates :account_type, :inclusion => { :in => [ 'credit', 'depository' ]  }

  validates :joint_owner_id, :uniqueness => { :scope => [:owner_id] }

  validates :name, :uniqueness => { :scope => [:owner_id] }

  validates :name, :presence => true

  validates :owner_id, :presence => true

end
