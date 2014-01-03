class QuestionsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @question = @article.comments.create(params[:question])
    redirect_to article_path(@article)
  end
end
