class UsersController < ApplicationController

  def new
  	@user = User.new
  	@users = User.all
  end

  def index
  	@users = User.all
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  			marker.lat user.latitude
  			marker.lng user.longitude

  			marker.infowindow user.description
		end  	
  end

  def create
  	@user = User.create(
  		params.require(:user).permit(:address, :title, :description))
  	redirect_to root_path
  end


end

