class QuestionsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @question = @article.questions.create(params[:questions])
    redirect_to article_path(@article)
  end

  private
    def question_params
      params.require(:title).permit(:auth_id, :content)
    end
end
