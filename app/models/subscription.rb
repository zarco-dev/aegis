class Subscription < ApplicationRecord
  has_one :user
  has_one :subscription_plan
end
