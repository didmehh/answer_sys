class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: [:edit, :update]
  def index
    @questions = Question.all.order('id desc')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(set_question_params)
    if @question.save
      redirect_to edit_admin_question_path(@question)
    else
      render :new
    end
  end

  def edit

  end

  def update
    puts "set_question_params是#{set_question_params}" * 30
    if @question.update(set_question_params)
      redirect_to admin_questions_path
    else
      redirect_to edit_admin_question_path(@question)
    end
  end

  private
  def set_question_params
    params.require(:question).permit(
      :content,
      result: [],
      question_options_attributes: [
        :content
      ]
    )
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
