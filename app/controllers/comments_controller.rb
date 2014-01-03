class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(params[:comment])
    redirect_to question_path(@question)
  end
end
