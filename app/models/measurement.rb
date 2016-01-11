class Measurement < ActiveRecord::Base
	belongs_to :user
	belongs_to :measure_name
	belongs_to :measure_unit
	accepts_nested_attributes_for :measure_name
	accepts_nested_attributes_for :measure_unit
	acts_as_taggable
end