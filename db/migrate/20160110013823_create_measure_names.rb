class CreateMeasureNames < ActiveRecord::Migration
  def change
    create_table :measure_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
