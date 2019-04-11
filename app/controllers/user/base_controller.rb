class User::BaseController < ApplicationController
  before_action :current_user

end
