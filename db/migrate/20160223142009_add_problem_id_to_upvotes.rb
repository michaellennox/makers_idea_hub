class AddProblemIdToUpvotes < ActiveRecord::Migration
  def change
    add_reference :upvotes, :problem, index: true, foreign_key: true
  end
end
