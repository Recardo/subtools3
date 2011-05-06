class Agent < ActiveRecord::Base
  acts_as_tree
  acts_as_commentable
  
  belongs_to :user
  belongs_to :address
  
  has_one :profil, :dependent => :destroy
  
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :address
  
  #validates_presence_of :name
  validates_associated :profil
  #validates_uniqueness_of :vatregno
  
  #attr_accessible :name, :address_id, :user_id
end
