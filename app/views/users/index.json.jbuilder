json.array!(@users) do |user|
  json.extract! user, :id, :name, :bio, :email, :github, :linkedin, :twitter, :facebook
  json.url user_url(user, format: :json)
end
