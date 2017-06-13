class UserAnswer < ApplicationRecord
  belongs_to :question

  serialize :result, Array

  scope :by_question, ->(question_id) { where(question_id: question_id) }
  scope :by_options, ->(ids) { where(result: ids) }
end
