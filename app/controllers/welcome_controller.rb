class WelcomeController < ApplicationController
  def index
  	@articles = Article.order("visits_count DESC").limit(5).offset(0)
  end
end
