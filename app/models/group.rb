class Group < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  has_many :group_invitations, dependent: :delete_all
  has_many :passwords, dependent: :nullify
end
