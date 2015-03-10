user_info = [
{
  :email => "user1@example.com",
  :password => "topsecret",
},
{
  :email => "user2@example.com",
  :password => "topsecret",
},
{
  :email => "user3@example.com",
  :password => "topsecret",
}
]

user_info.each do |user|
  u = User.new
  u.email = user[:email]
  u.password = user[:password]
  u.save
end

puts "There are now #{User.count} users in the database"

project_info = [
{
  :name => "A-Lister",
  :description => "Right app, right time",
  :url => "http://www.google.com",
  :user_id => "1"
},
{
  :name => "D-League",
  :description => "Play basketball with anyone in the city at any time",
  :url => "http://www.starterleague.com",
  :user_id => "2"
},
{
  :name => "Cardstock",
  :description => "Connecting teachers with parents to better student experience",
  :url => "http://www.nba.com",
  :user_id => "3"
},
{
  :name => "Crowdgate",
  :description => "Uber for Tailgating",
  :url => "http://www.nfl.com",
  :user_id => "1"
},
{
  :name => "Streamline",
  :description => "Helps you list equipment in more places in less time",
  :url => "http://www.yahoo.com",
  :user_id => "3"
}
]

project_info.each do |project|
  p = Project.new
  p.name = project[:name]
  p.description = project[:description]
  p.url = project[:url]
  p.user_id = project[:user_id]
  p.save
end

puts "There are now #{Project.count} projects in the database"
