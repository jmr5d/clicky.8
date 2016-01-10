json.array!(@measure_names) do |measure_name|
  json.extract! measure_name, :id, :name
  json.url measure_name_url(measure_name, format: :json)
end
