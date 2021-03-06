class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  #before_action CASClient::Frameworks::Rails::Filter, :is_admin?
  before_action :only_admin

  # GET /articles
  # GET /articles.json
  def index
    articles = Article.all
    @articles = articles.sort_by {|a| a.order }
    @title = "内容"
  end

  # GET /articles/explore
  # GET /explore
  def explore
    @raw_articles = Article.all
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

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @book = Book.find(params[:book_id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to @book, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def only_admin
      if session[:admin] == false
        redirect_to root_url
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:order, :title, :content, :public_at, :last_edit_at, :new_edit)
    end
end
