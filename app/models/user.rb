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
end
