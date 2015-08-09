class CreateLeadCharacteristicOfStudents < ActiveRecord::Migration
  def change
    create_table :lead_characteristic_of_students do |t|
      t.text :characteristic
      t.belongs_to :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
