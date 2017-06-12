class Admin::QuestionsController < Admin::BaseController

  def index
    @questions = Question.all.order('id desc')
  end

end
