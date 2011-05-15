class AgentsController < ApplicationController
  #before_filter :authenticate_user!, :except => :new
  before_filter :set_current_user
  
  # GET /agents
  # GET /agents.xml
  def index
    if current_user.admin?
      @agents = Agent.all
    else
      #return show
      @agents = Agent.find(:all, :conditions => {:parent_id => current_user.agent.id})
    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agents }
    end
  end
  
  # GET /agents/1
  # GET /agents/1.xml
  def show
    @agent = Agent.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agent }
    end
  end
  
  # GET /agents/new
  # GET /agents/new.xml
  def new
    @agent = Agent.new
    @agent.user = User.new
    @agent.address = Address.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agent }
    end
  end
  
  # GET /agents/1/edit
  def edit
    @agent = Agent.find(params[:id])
    @comment = Comment.new
    @commentable_type = 'Agent'
    @commentable_id = @agent.id
  end

    # GET /agents/1/password
  def password
    if params[:id] == -1
      @agent = Agent.new
    else
      @agent = Agent.find(params[:id])
    end    
  end
  
  # POST /agents
  # POST /agents.xml
  def create
    @agent = Agent.new(params[:agent])
    if user_signed_in? && current_user.agent.agency?
      @agent.parent_id = current_user.agent.id
    end
    respond_to do |format|
      if @agent.save
        format.html { redirect_to(@agent, :notice => 'Ihr Auftragnehmerprofil wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @agent, :status => :created, :location => @agent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agent.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /agents/1
  # PUT /agents/1.xml
  def update
    @agent = Agent.find(params[:id])

    respond_to do |format|
      if @agent.update_attributes(params[:agent])
        format.html { redirect_to(@agent, :notice => 'Agent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agent.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /agents/1
  # DELETE /agents/1.xml
  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy
    
    respond_to do |format|
      format.html { redirect_to(agents_url) }
      format.xml  { head :ok }
    end
  end
end
