user_info = [
{
  :email => "user1@example.com",
  :password => "12345678"
},
{
  :email => "user2@example.com",
  :password => "12345678"
},
{
  :email => "user3@example.com",
  :password => "12345678"
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
  :user_id => User.first
},
{
  :name => "D-League",
  :description => "Play basketball with anyone in the city at any time",
  :url => "http://www.starterleague.com",
  :user_id => User.first
},
{
  :name => "Cardstock",
  :description => "Connecting teachers with parents to better student experience",
  :url => "http://www.nba.com",
  :user_id => User.third
},
{
  :name => "Crowdgate",
  :description => "Uber for Tailgating",
  :url => "http://www.nfl.com",
  :user_id => User.first
},
{
  :name => "Streamline",
  :description => "Helps you list equipment in more places in less time",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "ntouch",
  :description => "music notification service",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "tax tracks",
  :description => "tracks you taxes",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "nfl",
  :description => "football",
  :url => "http://www.yahoo.com",
  :user_id => User.first
},
{
  :name => "nhl",
  :description => "hockey",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "mlb",
  :description => "baseball",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "nba",
  :description => "basketball",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "ncaa",
  :description => "college",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "LOL Cats",
  :description => "Maes people laugh",
  :url => "http://www.yahoo.com",
  :user_id => User.first
},
{
  :name => "Q-bert",
  :description => "Forgotten arcade game",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "Gundam",
  :description => "Giant Robot Anime",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "GhostBusters",
  :description => "We aint afraid of no ghost",
  :url => "http://www.yahoo.com",
  :user_id => User.first
},
{
  :name => "Batman",
  :description => "I am Batman",
  :url => "http://www.yahoo.com",
  :user_id => User.first
},
{
  :name => "teh sopranos",
  :description => "new jersey mafia",
  :url => "http://www.google.com",
  :user_id => User.first
},
{
  :name => "the wire",
  :description => "baltimore cops",
  :url => "http://www.starterleague.com",
  :user_id => User.first
},
{
  :name => "game of thrones",
  :description => "midevil",
  :url => "http://www.nba.com",
  :user_id => User.first
},
{
  :name => "simpsons",
  :description => "dont have a cow",
  :url => "http://www.nfl.com",
  :user_id => User.first
},
{
  :name => "family guy",
  :description => "giggidy",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "futureramma",
  :description => "bender",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "married with children",
  :description => "bundy",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "entourage",
  :description => "nepotism",
  :url => "http://www.yahoo.com",
  :user_id => User.first
},
{
  :name => "breaking bad",
  :description => "meth",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "casino",
  :description => "las vegas",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "goodfellas",
  :description => "paulie",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "a bronx tale",
  :description => "ny",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "walking dead",
  :description => "hbo",
  :url => "http://www.yahoo.com",
  :user_id => User.first
},
{
  :name => "cubs suck",
  :description => "over 100 years",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "white sox",
  :description => "good guys war black",
  :url => "http://www.yahoo.com",
  :user_id => User.third
},
{
  :name => "bears",
  :description => "mike ditka",
  :url => "http://www.yahoo.com",
  :user_id => User.first
},
{
  :name => "karate kid",
  :description => "jaden smith sucks",
  :url => "http://www.yahoo.com",
  :user_id => User.first
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

puts "There are now #{Project.count}, projects in the database"
