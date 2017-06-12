class Question < ApplicationRecord
  has_many :question_options, dependent: :destroy
  serialize :result, Array

  enum status: %i(useing unusing)

  def status_i18n
    statuses = { using: '使用中', unusing: '未使用' }
    statuses.fetch(status, "未知")
  end
end
