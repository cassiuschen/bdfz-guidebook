class HomeController < ApplicationController
  layout "blank"
  def index
    rand_seed = rand(100)
    @rand_image = rand_seed % 4 + 1
    @raw_articles = Article.all
    @articles = @raw_articles.sort_by {|a| a.order}
    time = Array.new
    for article in @articles
      time << article.updated_at
    end
    sort_time = time.sort!
    @last_edit = sort_time.last
  end
end
