class Favorite < ApplicationRecord
  # favoriteモデルはUserとBookに属している
  belongs_to :user
  belongs_to :book
  一人のユーザーは一回のいいねまで
  validates_uniqueness_of :recipe_id, scope: :user_id
end
