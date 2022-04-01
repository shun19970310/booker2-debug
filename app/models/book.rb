class Book < ApplicationRecord
  belongs_to :user
  # 投稿にはたくさんのいいねが付けられるイメージ
  has_many :favorites, dependent: :destroy
  # 投稿はいくつかのコメントを持てる
  has_many :book_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
