class Admin::QuestionsController < Admin::BaseController

  def index
    @questions = Question.all.order('id desc')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(set_question_params)
    if @question.save
      redirect_to admin_questions_path
    else
      render :new
    end
  end

  private
  def set_question_params
    params.require(:question).permit(
      :content,
      question_options_attributes: [
        :content
      ]
    )
  end
end
