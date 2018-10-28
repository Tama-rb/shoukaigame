class ChangeColumnNameToSomeTables < ActiveRecord::Migration[5.1]
  def change
    rename_column :conjunctions, :conjunction, :content
    rename_column :questions, :question, :content
    rename_column :themes, :theme, :content

    add_column :conjunctions, :impressions, :integer
    add_column :questions, :impressions, :integer
    add_column :themes, :impressions, :integer
  end
end
