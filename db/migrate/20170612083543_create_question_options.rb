class CreateQuestionOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :question_options do |t|
      t.integer :question_id
      t.string :content

      t.timestamps
    end
  end
end
