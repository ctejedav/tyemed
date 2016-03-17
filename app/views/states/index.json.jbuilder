json.array!(@states) do |state|
  json.extract! state, :id, :name, :abb
  json.url state_url(state, format: :json)
end
