class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :answer_id
      t.integer :votes
      t.timestamps
    end
  end
end
