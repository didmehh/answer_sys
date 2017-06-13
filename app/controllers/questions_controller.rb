class QuestionsController < ApplicationController
  def index
    @questions = Questions.using
  end
end
