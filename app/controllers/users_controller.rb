class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users= User.all
    @users.each do |u|
      u.username
    end
  end

end
