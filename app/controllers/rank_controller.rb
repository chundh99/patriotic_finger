class RankController < ApplicationController
  
  # GET /rank/users.xml
  def users
    @users = User.all(:order => "point DESC", :limit => 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # GET /rank/countries.xml
  def countries
    @countries = Country.all(:order => "point DESC", :limit => 50)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end
  
  # GET /rank/countryusers/:user_id.xml
  def countryusers
    @user = User.find(params[:user_id])
    @users = User.all(:conditions => {:country_id => @user.country_id}, :order => "point DESC", :limit => 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
end
