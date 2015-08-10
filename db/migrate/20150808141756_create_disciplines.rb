class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name, unique: true, null: false
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
