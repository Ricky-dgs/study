class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.references :grade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
