class CreateConjunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :conjunctions do |t|
      t.text :conjunction
      t.timestamps
    end
  end
end
