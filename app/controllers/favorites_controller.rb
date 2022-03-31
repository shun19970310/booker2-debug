class FavoritesController < ApplicationController
  # current_user.favorites.create→current_userに紐づいたいいねを作成
  # (book_id)→いいねした記事のid
  # つまりユーザーidと投稿idが保存される
  def create
   @favorite = current_user.favorites.create(book_id: params[:book_id])
  # いいねした時に前のページに戻る（一覧画面でいいねしたときは一覧ページに戻り、詳細画面でいいねしたときはまた詳細ページに戻る）
   redirect_back(fallback_location: root_path)
  end
  def destroy
   @book = Book.find(params[:book_id])
  # current_userに結びつているいいね(favorite)の中から上で定義した@bookのidをbook_idに入れたものを@favoriteに格納している
   @favorite = current_user.favorites.find_by(book_id: @book.id)
   @favorite.destroy
   # いいねした時に前のページに戻る（一覧画面でいいねしたときは一覧ページに戻り、詳細画面でいいねしたときはまた詳細ページに戻る
  # fallback_locationは万一一つ前のurlが見つからなかった時にroot_pathに遷移させる（エラー防止）
   redirect_back(fallback_location: root_path)
  end
end
