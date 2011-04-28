class PrincipalsController < ApplicationController
  #before_filter :authenticate_user!, :only => [:edit, :show, :index]
  before_filter :set_current_user
  
  # GET /principals
  # GET /principals.xml
  def index
    @principals = Principal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @principals }
    end
  end

  # GET /principals/1
  # GET /principals/1.xml
  def show
    @principal = Principal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @principal }
    end
  end

  # GET /principals/new
  # GET /principals/new.xml
  def new
    @principal = Principal.new
    @principal.user = User.new
    @principal.address = Address.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @principal }
    end
  end

  # GET /principals/1/edit
  def edit
    @principal = Principal.find(params[:id])
  end

  # POST /principals
  # POST /principals.xml
  def create
    @principal = Principal.new(params[:principal])
    
    respond_to do |format|
      if @principal.save
        format.html { redirect_to(@principal, :notice => 'Ihr Auftraggeberprofil wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @principal, :status => :created, :location => @principal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @principal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /principals/1
  # PUT /principals/1.xml
  def update
    @principal = Principal.find(params[:id])

    respond_to do |format|
      if @principal.update_attributes(params[:principal])
        format.html { redirect_to(@principal, :notice => 'Principal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @principal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /principals/1
  # DELETE /principals/1.xml
  def destroy
    @principal = Principal.find(params[:id])
    @principal.destroy

    respond_to do |format|
      format.html { redirect_to(principals_url) }
      format.xml  { head :ok }
    end
  end
end
