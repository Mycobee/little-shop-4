class MerchantsController < ApplicationController
  def index
    @active_merchants = User.where(role: 1).where(enabled: true)
  end
end
