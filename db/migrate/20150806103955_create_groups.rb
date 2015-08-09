class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, unique: true

      t.timestamps null: false
      t.index :name, unique: true
    end
  end
end
