class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :teacher_id
      t.integer :grade_id

      t.timestamps null: false
    end
  end
end
