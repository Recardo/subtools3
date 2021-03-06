class Principal < ActiveRecord::Base
  acts_as_commentable
  
  belongs_to :user
  belongs_to :address #, :dependent => :destroy
  
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :address
  
  has_many :searches, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  
  validates_associated :searches
  validates_presence_of :name
  #validates_uniqueness_of :vatregno
  
  #attr_accessible :name, :address_ids, :user_ids
end
