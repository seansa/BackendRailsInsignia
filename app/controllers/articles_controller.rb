class ArticlesController < ApplicationController
	def index
		@articles = Articles.all
	end
	def show
		@article = Articles.find(params[:id])
	end
end