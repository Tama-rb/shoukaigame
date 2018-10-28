class ChangeColumnNameToSomeTables < ActiveRecord::Migration[5.1]
  def up
    rename_column :conjunctions, :conjunction, :content
    rename_column :questions, :question, :content
    rename_column :themes, :theme, :content

    add_column :conjunctions, :impressions, :integer, default: 0
    add_column :questions, :impressions, :integer, default: 0
    add_column :themes, :impressions, :integer, default: 0

  end

  def down
    rename_column :conjunctions, :content, :conjunction
    rename_column :questions, :content, :question
    rename_column :themes, :content, :theme

    remove_column :conjunctions, :impressions, :integer, default: 0
    remove_column :questions, :impressions, :integer, default: 0
    remove_column :themes, :impressions, :integer, default: 0
  end
end
