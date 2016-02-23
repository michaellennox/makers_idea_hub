class AddSolutionIdToUpvotes < ActiveRecord::Migration
  def change
    add_reference :upvotes, :solution, index: true, foreign_key: true
  end
end
