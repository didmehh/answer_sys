class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.integer :question_id
      t.string :result
      t.integer :user_id

      t.timestamps
    end
  end
end
