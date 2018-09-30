class CreateImpressionQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :impression_questions do |t|
      t.text :question
      t.timestamps
    end
  end
end
