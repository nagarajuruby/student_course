class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :perent_mobile
      t.string :mobile
      t.string :city

      t.timestamps
    end
  end
end
