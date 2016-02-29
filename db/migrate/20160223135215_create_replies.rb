class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
