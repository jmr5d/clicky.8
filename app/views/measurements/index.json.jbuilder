json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :altitude, :latitude, :longitude, :happened_at, :user_id, :measure_name_id, :measure_unit_id, :value, :notes
  json.url measurement_url(measurement, format: :json)
end
