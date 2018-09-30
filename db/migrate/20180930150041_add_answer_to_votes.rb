class AddAnswerToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :answer, :text
  end
end
