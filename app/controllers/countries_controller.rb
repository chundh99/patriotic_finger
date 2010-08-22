class CountriesController < ApplicationController
  
  
  # POST /countries/reset/this1sfltpt.xml
  def reset
    @countries = Country.all
    
    @countries.each do |country|
      country.point = 0
      country.save
    end

    respond_to do |format|
      format.xml  { render :xml => @countries }
    end
  end
  
  # PUT /countries/point/value=:value&user_id=:user_id&country_id=:country_id.xml
  def point
    @country = Country.find(params[:country_id])
    @user = User.find(params[:user_id])
    
    if params[:value].to_i < 0
      @country.point +=params[:value].to_i
      @user.point -= params[:value].to_i
    else 
      @country.point += params[:value].to_i
      @user.point += params[:value].to_i
    end
    
    if @country.point <= -1000
      @country.point = -1000
    end
    
    respond_to do |format|
      if @country.update_attributes(params[:country]) && @user.update_attributes(params[:user])
        format.html { redirect_to(@country, :notice => 'Country was successfully updated.') }
        format.xml  { render :xml => @country }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /countries
  # GET /countries.xml
  def index
    @countries = Country.all(:order => "name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/new
  # GET /countries/new.xml
  def new
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.xml
  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to(@country, :notice => 'Country was successfully created.') }
        format.xml  { render :xml => @country, :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to(@country, :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.xml
  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    respond_to do |format|
      format.html { redirect_to(countries_url) }
      format.xml  { head :ok }
    end
  end
end
