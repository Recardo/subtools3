class Agent < ActiveRecord::Base
  belongs_to :user
  has_one :profil
  accepts_nested_attributes_for :user
end
