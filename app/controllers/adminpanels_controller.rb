class AdminpanelsController < ApplicationController
  
  def index
  	@users = User.order(:created_at)
  end

end
