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
  :user_id => User.first.id
},
{
  :name => "D-League",
  :description => "Play basketball with anyone in the city at any time",
  :url => "http://www.starterleague.com",
  :user_id => User.first.id
},
{
  :name => "Cardstock",
  :description => "Connecting teachers with parents to better student experience",
  :url => "http://www.nba.com",
  :user_id => User.third.id
},
{
  :name => "Crowdgate",
  :description => "Uber for Tailgating",
  :url => "http://www.nfl.com",
  :user_id => User.first.id
},
{
  :name => "Streamline",
  :description => "Helps you list equipment in more places in less time",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "ntouch",
  :description => "music notification service",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "tax tracks",
  :description => "tracks you taxes",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "nfl",
  :description => "football",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
},
{
  :name => "nhl",
  :description => "hockey",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "mlb",
  :description => "baseball",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "nba",
  :description => "basketball",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "ncaa",
  :description => "college",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "LOL Cats",
  :description => "Maes people laugh",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
},
{
  :name => "Q-bert",
  :description => "Forgotten arcade game",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "Gundam",
  :description => "Giant Robot Anime",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "GhostBusters",
  :description => "We aint afraid of no ghost",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
},
{
  :name => "Batman",
  :description => "I am Batman",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
},
{
  :name => "teh sopranos",
  :description => "new jersey mafia",
  :url => "http://www.google.com",
  :user_id => User.first.id
},
{
  :name => "the wire",
  :description => "baltimore cops",
  :url => "http://www.starterleague.com",
  :user_id => User.first.id
},
{
  :name => "game of thrones",
  :description => "midevil",
  :url => "http://www.nba.com",
  :user_id => User.first.id
},
{
  :name => "simpsons",
  :description => "dont have a cow",
  :url => "http://www.nfl.com",
  :user_id => User.first.id
},
{
  :name => "family guy",
  :description => "giggidy",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "futureramma",
  :description => "bender",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "married with children",
  :description => "bundy",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "entourage",
  :description => "nepotism",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
},
{
  :name => "breaking bad",
  :description => "meth",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "casino",
  :description => "las vegas",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "goodfellas",
  :description => "paulie",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "a bronx tale",
  :description => "ny",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "walking dead",
  :description => "hbo",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
},
{
  :name => "cubs suck",
  :description => "over 100 years",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "white sox",
  :description => "good guys war black",
  :url => "http://www.yahoo.com",
  :user_id => User.third.id
},
{
  :name => "bears",
  :description => "mike ditka",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
},
{
  :name => "karate kid",
  :description => "jaden smith sucks",
  :url => "http://www.yahoo.com",
  :user_id => User.first.id
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
