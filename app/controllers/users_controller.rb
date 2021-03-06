class UsersController < ApplicationController
  
  # GET /users/login/:device_id.xml
  def login
    @user = User.all(:conditions => {:device_id => params[:device_id]})
    
    if @user.count == 0
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => "<errors><error>No user</error></errors>" }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  # POST /users/new/name=:name&country_id=:country_id&device_id=:device_id.xml',
  def create
    @user = User.new(params[:user])
    
    @user.name = params[:name]
    @user.country_id = params[:country_id]
    @user.device_id = params[:device_id]

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  # PUT /users/update/user_id=:id&country_id=:country_id.xml
  def update
    @user = User.find(params[:id])
    
    @user.country_id = params[:country_id]

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { render :xml => @user }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  # DELETE /users/delete/:id.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
