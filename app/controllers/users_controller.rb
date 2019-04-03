class UsersController < ApplicationController

  def show
    require 'pry'; binding.pry
    @user = User.find(params[:id])

  end

  def new
    require 'pry'; binding.pry
  end

  def create
    require 'pry'; binding.pry
  end

end
