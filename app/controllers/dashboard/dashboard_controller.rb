class Dashboard::DashboardController < Dashboard::BaseController
  def show
    @user = current_user
  end
end
