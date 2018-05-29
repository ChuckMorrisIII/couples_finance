class User < ApplicationRecord
  # Direct associations

  has_many   :joint_accounts,
             :class_name => "Account",
             :foreign_key => "joint_owner_id",
             :dependent => :nullify

  has_many   :accounts,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
