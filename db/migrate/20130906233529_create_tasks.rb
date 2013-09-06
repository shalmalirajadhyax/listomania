class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.string :category
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
