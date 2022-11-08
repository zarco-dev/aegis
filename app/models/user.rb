class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  has_one :subscription
  has_one :subscription_plan, through: :subscription
  has_many :bank_passwords, dependent: :delete_all
  has_many :passwords, dependent: :delete_all
  has_many :groups, foreign_key: :user_id
  has_many :group_invitations, dependent: :delete_all

  validates :username, presence: { message: "no debe estar vacio" }, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "debe contener solo letras" }, length: { minimum: 3, message: "es muy corto, minimo 3 caracteres" }

  validates :email, presence: true, uniqueness: true, format: { with: /\S+@\S+\.\S+/, message: "debe tener el formato correcto" }

  after_create :create_plan

  private

  def create_plan
    if self.premium_user == true
      planid = 2
      exp_date = Date.today.next_month
    elsif self.premium_user == false
        planid = 1
        exp_date = nil
    end
    @subscription = Subscription.new(
      begining_date: Date.today,
      expired_date: exp_date
    )
    @subscription.user_id = self.id
    @subscription.subscription_plan_id = planid
    @subscription.save
    # raise
  end

end
