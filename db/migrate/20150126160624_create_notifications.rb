class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :comment, index: true
      t.references :user, index: true
      t.boolean :read

      t.timestamps null: false
    end
    add_foreign_key :notifications, :comments
    add_foreign_key :notifications, :users
  end
end
