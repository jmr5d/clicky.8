class MeasureUnit < ActiveRecord::Base
  has_many :measurements
  has_many :preferences
  has_many :measure_names
end