class ExploreController < ApplicationController
  def index
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
end
