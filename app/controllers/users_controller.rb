class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users.each do |u|
      u.username
    end
  end

end
