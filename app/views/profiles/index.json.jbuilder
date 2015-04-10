json.array!(@profiles) do |profile|
  json.extract! profile, :id, :email, :name
  json.url profile_url(profile, format: :json)
end
