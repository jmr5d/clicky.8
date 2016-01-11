class MeasureName < ActiveRecord::Base
  has_many :measurements
  has_one :preference
  has_one :measure_unit
end
