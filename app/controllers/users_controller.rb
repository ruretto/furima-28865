class UsersController < ApplicationController
  before_action :require_login
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new()
  end
  
  def edit
  end

  def create
    @user = User.new(user_params)
  end

  def update
  end

  def destroy
  end

  private

end

