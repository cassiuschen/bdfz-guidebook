class ExploreController < ApplicationController
  #def index
#    @raw_articles = Book.all.first.articles.all
#    @articles = @raw_articles.sort_by {|a| a.order}
#    time = Array.new
#    for article in @articles
#      time << article.updated_at
#    end
#    sort_time = time.sort!
#    @last_edit = sort_time.last
#    t = @last_edit.to_s
#    p = /(....)-(..)-(..)/ 
#    p.match(t)
#    year = $1.to_i
#    month = $2.to_i
#    version = "#{year}年#{month}月修订版"
#    @title = version
#  end

  def show
    @book = Book.where("id = ?", explore_params.to_i).last
    @raw_articles = @book.articles.all
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

  private
  def explore_params
    params[:id]
  end
end
