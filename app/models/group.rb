class Group < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_many :group_invitations
  has_many :passwords
end
