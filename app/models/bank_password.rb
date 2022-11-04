class BankPassword < ApplicationRecord
  belongs_to :user

  validates :account_number, presence: true, uniqueness: true, length: { is: 19 }

  validates :cardholder, presence: true
  validates :secure_code, presence: true
  # validates :expiration_date, presence: true


  # t.string "cardholder"
  #   t.string "account_type"
  #   t.string "bank_name"
  #   t.string "franchise"
  #   t.datetime "expiration_date"
  #   t.bigint "user_id", null: false
end
