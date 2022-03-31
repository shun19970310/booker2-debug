class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  # ユーザーにもbookモデルに記入したfavoriteモデルとのアソシエーションをかく
  has_many :favorites, dependent: :destroy
  # ユーザーはいくつかのコメントができる
  has_many :comments, dependent: :destroy
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: {maximum: 50}

  # いいねをしたかしていないかを判定するメソッド
  # selfにはcurrent_userが入っているイメージ
  # つまりcurrent_userに結びついているいいね（favorite）の中でbook_idが今いいねしようとしているbook.id（bookのid）が存在するか？
  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
