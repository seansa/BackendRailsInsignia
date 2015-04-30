class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :flags
  has_many :flaggers, through: :flags, source: :user

  validates :body, presence: true, length: { minimum: 4 }
end
