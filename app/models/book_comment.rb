class BookComment < ApplicationRecord
  # コメントは一人のユーザーと一つの投稿に紐づく
  belongs_to :user
  belongs_to :book
  # 空のコメントは保存できないこと
  validates :comment, presence: true
end
