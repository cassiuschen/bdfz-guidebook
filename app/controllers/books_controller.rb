class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @title = "手册内容"
  end

  def explore
    @raw_articles = Book.all.first.articles.all
    @articles = @raw_articles.sort_by {|a| a.order}
    time = Array.new
    for article in @articles
      time << article.updated_at
    end
    sort_time = time.sort!
    @last_edit = sort_time.last
    t = @last_edit.to_s
    p = /(....)-(..)-(..)/ 
    p.match(t)
    year = $1.to_i
    month = $2.to_i
    version = "#{year}年#{month}月修订版"
    @title = version
  end

  # GET /books/1
  # GET /books/1.json
  def show
    articles = @book.articles.all
    @articles = articles.sort_by {|a| a.order }
    @title = "内容"
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title)
    end
end
