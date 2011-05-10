class CommentsController < ApplicationController
  
  def add_comment
    @commentable_type = params[:comment][:commentable_type]
    @commentable_id = params[:comment][:commentable_id]
    
    puts params
    
    commentable = find_commentable(@commentable_type, @commentable_id)
    if commentable
      @comment = commentable.comments.build(params[:comment])
      @comment.user = current_user
      commentable.save
    end
    
    #puts @comment
    commentable.comments << @comment
    
    redirect_to :action => 'edit', :id => @commentable_id, :controller => @commentable_type.pluralize.downcase
    #redirect_to :action => "show", :id => params[:id], :controller
  end
  
  def find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id.to_i)    
  end
  
  # GET /comments
  # GET /comments.xml
  def index
    #@commentable = find_commentable
    #@comments = @commentable.comments
    @comments = Comment.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end
  
  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end
  
  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end
  
  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end
  
  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    #@commentable = find_commentable
    #@comment = @commentable.comments.build(params[:comment])
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
