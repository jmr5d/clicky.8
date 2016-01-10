json.array!(@preferences) do |preference|
  json.extract! preference, :id, :measure_name_id, :user_id, :position, :measure_unit_id, :frequency
  json.url preference_url(preference, format: :json)
end
