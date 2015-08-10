class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :first_name
      t.string  :last_name
      t.date    :birth_date
      t.datetime :registered_at
      t.string  :email
      t.inet    :ip_address
      t.integer :semester
      t.decimal :average_grade

      t.timestamps null: false
      t.integer :lock_version, default: 0
      t.belongs_to :group, index: true, foreign_key: true
      t.index :email
      t.index :ip_address
      t.index :semester
    end
  end
end
