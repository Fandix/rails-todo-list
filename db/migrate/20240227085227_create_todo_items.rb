class CreateTodoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
