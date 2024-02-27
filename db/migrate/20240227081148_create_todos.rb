class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :content
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
