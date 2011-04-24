class Principal < ActiveRecord::Base
  belongs_to :user
  has_many :searches
  accepts_nested_attributes_for :user
end
