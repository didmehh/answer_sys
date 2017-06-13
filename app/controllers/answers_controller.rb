class AnswersController < ApplicationController
  def new
    @answer = UserAnswer.new
    @questions = Question.using.page(params[:page])
  end

  def index
    @questions = Question.using.page(params[:page]).per(15)
  end

  def create
    @answer = current_user.answers.by_question(set_answer_params[:question_id]).last
    if @answer.present?
      @answer.update(set_answer_params)
      if params[:commit] == "下一题"
        redirect_to new_answer_path(page: params[:next_page])
      else
        redirect_to answers_path
      end
    else
      @answer = UserAnswer.new(set_answer_params)
      if @answer.save
        if params[:commit] == "下一题"
          redirect_to new_answer_path(page: params[:next_page])
        else
          redirect_to answers_path
        end
      else
        redirect_to new_answer_path(page: params[:current_page])
      end
    end
  end

  private
  def set_answer_params
    params[:user_answer][:user_id] = current_user.id
    params.require(:user_answer).permit(
      :question_id,
      :user_id,
      result: []
    )
  end
end
