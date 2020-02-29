class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(list.id)
  end

  def create
        # ストロングパラメーターを使用
         book = Book.new(book_params)
        # DBへ保存する
         book.save
        # トップ画面へリダイレクト
        redirect_to book_path(book.id)
    end
    private
   
   def book_params
        params.require(:book).permit(:Title, :Body)
    end

end
