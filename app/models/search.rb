class Search < ActiveRecord::Base
  attr_accessible :category_id
  belongs_to :principal
  belongs_to :category
  validates_presence_of :category_id
  attr_accessible :category_id, :wage
  
  def profils
    @profils ||= find_profils
  end
  
  private
  
  def find_profils
    Profil.find(:all, :conditions => conditions)
  end
  
  def wage_conditions
    ["profils.wage <= ?", wage] unless wage.blank?
  end
  
  def category_conditions
    ["profils.category_id = ?", category_id] unless category_id.blank?
  end
  
  def active_conditions
    ["profils.active = ?", true]
  end
  
  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end
  
  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end
  
  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end
  
  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
end
