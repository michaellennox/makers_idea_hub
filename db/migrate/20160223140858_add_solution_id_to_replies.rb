class AddSolutionIdToReplies < ActiveRecord::Migration
  def change
    add_reference :replies, :solution, index: true, foreign_key: true
  end
end
