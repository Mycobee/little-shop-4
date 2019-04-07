class Merchant::BaseController < ApplicationController
  before_action :require_merchant, :require_admin


  def require_merchant
    render file:"/public/404" unless current_merchant?
  end

  def require_admin
    if current_user.admin?
      render file:"/admin/merchants/#{current_user.id}"
    end
  end
end
