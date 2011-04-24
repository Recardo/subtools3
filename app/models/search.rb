class Search < ActiveRecord::Base
  #attr_accessible :category_id
  
  def profils
    @profils ||= find_profils
    #@profils = Profil.find(:all)
  end
  
  private
  
  def find_profils
    Profil.find(:all, :conditions => conditions)
  end
  
  def category_conditions
    ["profils.category_id = ?", category_id] unless category_id.blank?
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
