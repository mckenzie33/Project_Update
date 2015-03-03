class Group < ActiveRecord::Base
  has_many :memberships, :foreign_key => "group_id", dependent: :destroy
  has_many :users, through: :memberships
  has_many :testfiles, :foreign_key => "group_id", dependent: :destroy
  has_many :mat_membership, :foreign_key => "group_name"
  has_many :materials, through: :mat_membership
  validates :groupname, uniqueness: true
  attr_accessible :groupname, :description, :is_public, :owner_id, :owner_email, :owner_name
end
