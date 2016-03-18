json.array!(@leads) do |lead|
  json.extract! lead, :id, :first_name, :last_name, :phone, :address, :city, :state, :county, :zip_code, :est_age, :birth_month, :est_income
  json.url lead_url(lead, format: :json)
end
