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
      @book = Book.find(params[:id])
      if @book.update(book_params)
      redirect_to book_path(@book.id), flash: { notice: 'Book was successfully updated.' }
    else
      render :edit
    end
  end

  def destroy
      book = Book.find(params[:id]) #データ(レコード)を1件取得
      book.destroy #データ（レコード）を削除
      redirect_to books_path #List一覧画面へリダイレクト
  end

  def create
        # ストロングパラメーターを使用
         @book = Book.new(book_params)
        # DBへ保存する
         if @book.save
        # トップ画面へリダイレクト
        redirect_to book_path(@book.id), flash: { notice: 'Book was successfully created.' }
      else
        @books = Book.all
        render :index
      end
    end
    
    private
   
   def book_params
        params.require(:book).permit(:title, :body)
    end

end
