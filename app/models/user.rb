class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments
  has_many :favorites
  has_many :favorited_articles, through: :favorites, source: :article

	def already_favorited?(article)
    favorited_articles.where(id: article.id).count > 0
  end

end
