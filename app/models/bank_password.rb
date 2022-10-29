class BankPassword < ApplicationRecord
  belongs_to :user

  # validates :account_number, :cardholder, presence: true
end
