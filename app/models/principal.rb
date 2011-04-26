class Principal < ActiveRecord::Base
  belongs_to :user
  has_many :searches, :dependent => :destroy
  accepts_nested_attributes_for :user
  
  validates_associated :searches
  validates_presence_of :name
  #validates_uniqueness_of :vatregno
end
