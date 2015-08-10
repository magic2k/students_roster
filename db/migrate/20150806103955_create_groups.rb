class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, unique: true
      t.integer :student_id, unique: true

      t.timestamps null: false
      t.integer :lock_version, default: 0
      t.index :name, unique: true
    end
  end
end
