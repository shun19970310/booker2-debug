class Favorite < ApplicationRecord
  # favoriteモデルはUserとBookに属している
  belongs_to :user
  belongs_to :book
  # 一人のユーザーは一回のいいねまで(ユーザーは一つの投稿に一つしかいいねできないこと)
  validates_uniqueness_of :book_id, scope: :user_id
end
