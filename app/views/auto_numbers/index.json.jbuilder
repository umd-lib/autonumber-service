json.array!(@auto_numbers) do |auto_number|
  json.extract! auto_number, :id, :entry_date, :name_id, :repository_id
  json.url auto_number_url(auto_number, format: :json)
end
