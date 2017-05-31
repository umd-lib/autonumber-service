json.array!(@names) do |name|
  json.extract! name, :id, :initials
  json.url name_url(name, format: :json)
end
