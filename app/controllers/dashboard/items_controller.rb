class Dashboard::ItemsController < Dashboard::BaseController
  def index
    @user = current_user
  end
end
