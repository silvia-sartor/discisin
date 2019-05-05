require 'csv'

puts 'Cleaning database...'
Favorite.destroy_all
Member.destroy_all
Point.destroy_all
Sotg.destroy_all
Match.destroy_all
Team.destroy_all
Category.destroy_all
Event.destroy_all
User.destroy_all

puts 'Creating fake admin...'

user = User.create(
  firstname: "admin",
  lastname: "admin",
  email: "silviasartor@ymail.com",
  password: "123456",
  phone: "3335435156"
)

puts 'Creating fake event...'

event = Event.create(
  name: "CIU",
  when: "2019-05-05",
  city: "Italia",
  price: 30.00,
  currency: "euro",
  contact: "segreteria@fifd.it",
  user_id: User.first.id,
  picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDdh3SeK71DJWGjgQy4yWUsEF0Bxa2eH8H0VcYv18Ba-hFA4O"
)

event = Event.create(
  name: "Tappa MA MB WB",
  when: "2019-03-17",
  city: "Italia",
  contact: "segreteria@fifd.it",
  user_id: User.first.id,
  links: "vedi ciu",
  picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDdh3SeK71DJWGjgQy4yWUsEF0Bxa2eH8H0VcYv18Ba-hFA4O"
)

event = Event.create(
  name: "Tappa MA MB WB",
  when: "2019-04-14",
  city: "Italia",
  contact: "segreteria@fifd.it",
  user_id: User.first.id,
  links: "vedi ciu",
  picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDdh3SeK71DJWGjgQy4yWUsEF0Bxa2eH8H0VcYv18Ba-hFA4O"
)

puts 'Creating fake categories...'

categories_ma = Category.create(
  event_id: Event.first.id,
  cat: "MA"
  )
categories_wb = Category.create(
  event_id: Event.first.id,
  cat: "WB"
  )
categories_mb = Category.create(
  event_id: Event.first.id,
  cat: "MB"
  )

puts 'Creating fake teams...'

csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'teams.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
csv2.each do |row|
  t = Team.new
  t.user = User.where(firstname: "admin").first
  t.name = row['name']
  t.city = row['city']
  t.accepted = true
  t.category = Category.where(cat: row['category'], event: Event.first).first
  t.save
end

puts 'Creating fake matches...'

def points(hometeam_score, awayteam_score)
  if hometeam_score - awayteam_score >= 4
    return 3
  elsif hometeam_score - awayteam_score > 0
    return 2
  elsif hometeam_score - awayteam_score > -4
    return 1
  else hometeam_score - awayteam_score <= -4
    return 0
  end
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'matches.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Match.new
  t.name = row['name']
  t.day_time = row['day_time']
  t.address = row['address']
  t.field = row['field']
  t.game_length = row['game_length']
  t.hometeam = Team.where(name: row['hometeam']).first
  t.hometeam_score = row['hometeam_score'].to_i
  t.awayteam = Team.where(name: row['awayteam']).first
  t.awayteam_score = row['awayteam_score'].to_i
  t.save
end

puts 'Creating fake points...'
matches = Match.all
matches.each do |match|

  if match.game_points

    Point.create(
      match_id: match.id,
      team_id: Team.find(match.hometeam_id).id,
      pt: points(match.hometeam_score, match.awayteam_score),
      metefatte: match.hometeam_score,
      metesubite: match.awayteam_score,
      metedifference: match.hometeam_score - match.awayteam_score
    )
    Point.create(
      match_id: match.id,
      team_id: Team.find(match.awayteam_id).id,
      pt: points(match.awayteam_score, match.hometeam_score),
      metefatte: match.awayteam_score,
      metesubite: match.hometeam_score,
      metedifference: match.awayteam_score - match.hometeam_score
    )
    # puts "#{n}"
    # n += 1
  end
end

puts 'Creating fake sotg...'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'sotgs.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Sotg.new
  t.voting_team = Team.where(name: row['voting_team']).first
  t.voted_team = Team.where(name: row['voted_team']).first
  if Match.where(hometeam: t.voting_team, awayteam: t.voted_team).empty?
    t.match =  Match.where(hometeam: t.voted_team, awayteam: t.voting_team).first
  else
    t.match = Match.where(hometeam: t.voting_team, awayteam: t.voted_team).first
  end
  t.sotg1 = row['sotg1'].to_i
  t.sotg2 = row['sotg2'].to_i
  t.sotg3 = row['sotg3'].to_i
  t.sotg4 = row['sotg4'].to_i
  t.sotg5 = row['sotg5'].to_i
  t.total = row['sotg1'].to_i + row['sotg2'].to_i + row['sotg3'].to_i + row['sotg4'].to_i + row['sotg5'].to_i
  t.save
end

puts 'seed done!'
