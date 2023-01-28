class ChangeCommentsToBookComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :book_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :book_id

    end

  end
end
