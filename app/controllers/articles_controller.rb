class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	def show
		@article = Articles.find(params[:id])
	end
end