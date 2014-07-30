class Api::V1::ArticleController < Api::V1::BaseController
  def get_info
    article = Article.where("id = ?", info_params).last
    json = {
      title: article.title,
      order: article.order,
      content: article.content
    }
    render json: json
  end

  def get_list
    book = Book.where("id = ?", info_params).last
    render json: book.articles.all.sort_by{|a| a.order}
  end

  def get_last_order
    book = Book.where("id = ?", info_params).last
    render json: book.articles.all.map {|a| a.order}.max || 1
  end

  def update
    article = Article.where("id = ?", info_params).last
    article.update_attributes update_params
    if article.save
      render json: {status: 'success'}
    else
      render json: {status: 'error'}
    end
  end

  def new
    book = Book.where("id = ?", info_params).last
    a = book.articles.new(new_params)
    if a.save
      json = {
        status: "success",
        article: a
      }.to_json
      render json: json
    else
      render json: {status: "error"}
    end
  end

  private
  def info_params
    params[:id].to_i
  end

  def update_params
    params.require(:article).permit(:title, :order, :content)
  end

  def new_params
    params.require(:article).permit(:title, :order, :content)
  end
end