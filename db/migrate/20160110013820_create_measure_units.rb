class CreateMeasureUnits < ActiveRecord::Migration
  def change
    create_table :measure_units do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
