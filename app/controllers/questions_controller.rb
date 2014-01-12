class QuestionsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @question = @article.questions.create(params[:question].permit(:title))
    redirect_to article_path(@article)
  end
end
