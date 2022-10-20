class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_create :plan_type
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :subscription
  has_one :subscription_plan, through: :subscription
  has_many :bank_passwords, dependent: :delete_all
  has_many :passwords, dependent: :delete_all
  has_many :groups, dependent: :delete_all
  has_many :group_invitations, dependent: :delete_all

  private

  # def plan_type
  #   # if self.premium_user == "1"
  #   #   self.premium_user = true
  #   # end
  #   raise
  # end

end
