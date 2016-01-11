class AddDefaultMeasureUnitIdToMeasureName < ActiveRecord::Migration
  def change
    add_reference :measure_names, :measure_unit, index: true
  end
end