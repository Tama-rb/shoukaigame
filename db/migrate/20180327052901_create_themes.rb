class CreateThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.text :theme
      t.timestamps
    end
  end
end
