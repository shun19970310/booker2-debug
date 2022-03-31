class Book < ApplicationRecord
  belongs_to :user
  # 投稿にはたくさんのいいねが付けられるイメージ
  has_many :favorites, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
