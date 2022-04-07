class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
        #render先にjsファイルを指定
    else
      render :books/show
    # コメント後は行う前の画面に遷移すること
    # redirect_to request.referer
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # コメント削除後は行う前の画面に遷移すること
    # redirect_to request.referer
    flash.now[:alert] = '投稿を削除しました'
    #renderしたときに@postのデータがないので@postを定義
    @post = Post.find(params[:post_id])
    #render先にjsファイルを指定
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
