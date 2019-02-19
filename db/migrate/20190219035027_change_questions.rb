class ChangeQuestions < ActiveRecord::Migration[5.2]
  def up
    add_column :questions, :category, :integer
  end

  def down
    remove_column :questions, :category, :integer
  end
end
