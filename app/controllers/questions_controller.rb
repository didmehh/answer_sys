class QuestionsController < ApplicationController
  def index
    answer?
    @questions = Question.using
  end

  private
  def answer?

  end
end
