class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :discipline_id
      t.integer :grade

      t.timestamps null: false
      t.index :student_id
      t.index :discipline_id
      t.index([:student_id, :discipline_id], unique: true)
    end

  end
end
