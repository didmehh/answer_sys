class Question < ApplicationRecord
  paginates_per 1

  has_many :question_options, dependent: :destroy
  has_many :answers, class_name: 'UserAnswer'
  serialize :result, Array

  accepts_nested_attributes_for :question_options

  enum status: %i(using unusing)

  def status_i18n
    statuses = { using: '使用中', unusing: '未使用' }
    statuses.fetch(status.to_sym, "未知")
  end
end
