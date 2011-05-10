class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  
  #validates_inclusion_of :status, :in => [:Telefonat, :Email, :Sonstiges]
end
