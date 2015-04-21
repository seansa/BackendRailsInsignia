class WelcomeController < ApplicationController
  def index
  	@articles = Article.order("visits_count DESC").limit(5).offset(1)
  end
end
