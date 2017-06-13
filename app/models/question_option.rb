class QuestionOption < ApplicationRecord
  belongs_to :question

  scope :by_ids, ->(ids) { where(id: ids) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
end
