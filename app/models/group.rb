class Group < ApplicationRecord
  belongs_to :user
  has_many :group_invitations
  has_many :passwords
end
