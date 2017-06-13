class User < ApplicationRecord
  has_many :answers, class_name: 'UserAnswer'
end
