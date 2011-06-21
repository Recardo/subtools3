class RequestsController < ApplicationController
  def create
    r = Request.create
    r.principal = current_user.principal
    r.save
    
    p = Profil.find(params['profil_id'])
    
    rp = RequestPosition.create
    rp.request = r
    rp.profil = p
    rp.wage = p.wage
    rp.status = 'anfrage' 
    rp.save
    
    @request = r
  end

  def edit
  end

end
