class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :measure_name, index: true
      t.references :user, index: true
      t.integer :position
      t.references :measure_unit, index: true
      t.integer :frequency

      t.timestamps
    end
  end
end
