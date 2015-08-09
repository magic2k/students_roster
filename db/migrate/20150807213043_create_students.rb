class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :first_name
      t.string  :last_name
      t.date    :birth_date
      t.string  :email
      t.inet    :ip_address
      t.integer :semester

      t.timestamps null: false

      t.belongs_to :group, index: true, foreign_key: true
      t.index :email
      t.index :ip_address
      t.index :semester
    end
  end
end
