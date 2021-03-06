class User < ActiveRecord::Base
  has_one :principal, :dependent => :destroy
  has_one :agent, :dependent => :destroy
  
  accepts_nested_attributes_for :agent
  accepts_nested_attributes_for :principal
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :vatregno
  
  #validates_uniqueness_of :email  
  #validates_associated :principal
  #validates_associated :agent
  
  def self.current
    Thread.current[:user]
  end
  
  def self.current=(user)
    Thread.current[:user] = user
  end
  
  
end
