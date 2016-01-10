class Measurement < ActiveRecord::Base
  belongs_to :user
  belongs_to :measure_name
  belongs_to :measure_unit
end
