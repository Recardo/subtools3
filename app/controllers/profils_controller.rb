class ProfilsController < ApplicationController
  before_filter :authenticate_user!
  # GET /profils
  # GET /profils.xml
  def index
    #@profils = Profil.all
    #@profils = Profil.find_all_by_agent_id(current_user.agent)
    @profils = Profil.where(:agent_id => current_user.agent.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profils }
    end
  end

  # GET /profils/1
  # GET /profils/1.xml
  def show
    @profil = Profil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profil }
    end
  end

  # GET /profils/new
  # GET /profils/new.xml
  def new
    @profil = Profil.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profil }
    end
  end

  # GET /profils/1/edit
  def edit
    @profil = Profil.find(params[:id])
  end

  # POST /profils
  # POST /profils.xml
  def create
    @profil = Profil.new(params[:profil])
    @profil.agent = current_user.agent
    respond_to do |format|
      if @profil.save
        format.html { redirect_to(@profil, :notice => 'Profil was successfully created.') }
        format.xml  { render :xml => @profil, :status => :created, :location => @profil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profils/1
  # PUT /profils/1.xml
  def update
    @profil = Profil.find(params[:id])

    respond_to do |format|
      if @profil.update_attributes(params[:profil])
        format.html { redirect_to(@profil, :notice => 'Profil was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profils/1
  # DELETE /profils/1.xml
  def destroy
    @profil = Profil.find(params[:id])
    @profil.destroy

    respond_to do |format|
      format.html { redirect_to(profils_url) }
      format.xml  { head :ok }
    end
  end
end
