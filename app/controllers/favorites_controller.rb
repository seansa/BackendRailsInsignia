class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def show
		@articles = Favorite.where("#{current_user.id}")
	end

	def update
		@article = Article.find(params[:id])
	      type = params[:type]
	      if type == "favorite"
	        current_user.favorited_articles << @article
			redirect_to @article, notice: "Agregado a Favorito"

	      elsif type == "unfavorite"
	        current_user.favorited_articles.delete(@article)
	        redirect_to :back, notice: 'Eliminado de Favoritos'
	    end
	end

end
