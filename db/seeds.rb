# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database...'
Favorite.destroy_all
Point.destroy_all
Match.destroy_all
Team.destroy_all
Event.destroy_all
User.destroy_all

puts 'Creating fake admin...'

user = User.create(
  firstname: "admin",
  lastname: "admin",
  email: "silviasartor@ymail.com",
  password: "123456",
  phone: "3335435156",
)

puts 'Creating fake event...'

event = Event.create(
  name: "CIU Women B",
  when: "2017-12-15",
  where: "Via del sale 60, Cremona, Italia",
  price: 30.00,
  currency: "euro",
  categories: ["Women"],
  contact: "segreteria@fifd.it",
  user_id: User.first.id,
)

puts 'Creating fake teams...'

hub = Team.create(
  name: "Hub",
  category: "Women",
  n_players: 18,
  city: "Verona-Cremona-Trento",
  rating: 3,
  accepted: true,
  user_id: User.first.id,
  event_id: Event.first.id
)

donkey = Team.create(
  name: "Donkey Ladies",
  category: "Women",
  n_players: 18,
  city: "Milano",
  # rating: 3,
  accepted: true,
  user_id: User.first.id,
  event_id: Event.first.id
)

fireflies = Team.create(
  name: "Fireflies",
  category: "Women",
  n_players: 18,
  city: "Torino",
  # rating: 3,
  accepted: true,
  user_id: User.first.id,
  event_id: Event.first.id
)

cusb_west = Team.create(
  name: "CUSB Red Bulle West",
  category: "Women",
  n_players: 18,
  city: "Bologna",
  # rating: 3,
  accepted: true,
  user_id: User.first.id,
  event_id: Event.first.id
)

duepick = Team.create(
  name: "2DPick",
  category: "Women",
  n_players: 18,
  city: "Reggio-Parma-Brescia",
  # rating: 3,
  accepted: true,
  user_id: User.first.id,
  event_id: Event.first.id
)

tane = Team.create(
  name: "CUS Padova Tane Malefiche",
  category: "Women",
  n_players: 18,
  city: "Padova",
  # rating: 3,
  accepted: true,
  user_id: User.first.id,
  event_id: Event.first.id
)

puts 'Creating fake matches...'

match_one = Match.create(
  name: "WB N",
  day: "2019-04-14",
  start_time: "9:00",
  game_length: 80 ,
  where: "via del sale 60, Cremona",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Donkey Ladies").first.id,
  awayteam_id: Team.where(name: "Hub").first.id,
  event_id: Event.first.id,
  hometeam_score:11,
  awayteam_score:13
)


match_one = Match.create(
  name: "WB N",
  day: "2019-04-14",
  start_time: "10:30",
  game_length: 80 ,
  where: "via del sale 60, Cremona",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Fireflies").first.id,
  awayteam_id: Team.where(name: "CUSB Red Bulle West").first.id,
  event_id: Event.first.id,
  hometeam_score:13,
  awayteam_score:7
)

match_one = Match.create(
  name: "WB N",
  day: "2019-04-14",
  start_time: "12:00",
  game_length: 80 ,
  where: "via del sale 60, Cremona",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Donkey Ladies").first.id,
  awayteam_id: Team.where(name: "2DPick").first.id,
  event_id: Event.first.id,
  hometeam_score:15,
  awayteam_score:4
)

match_one = Match.create(
  name: "WB N",
  day: "2019-04-14",
  start_time: "13:30",
  game_length: 80 ,
  where: "via del sale 60, Cremona",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Fireflies").first.id,
  awayteam_id: Team.where(name: "CUS Padova Tane Malefiche").first.id,
  event_id: Event.first.id,
  hometeam_score:8,
  awayteam_score:11
)

match_one = Match.create(
  name: "WB N",
  day: "2019-04-14",
  start_time: "15:00",
  game_length: 80 ,
  where: "via del sale 60, Cremona",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Hub").first.id,
  awayteam_id: Team.where(name: "2DPick").first.id,
  event_id: Event.first.id,
  hometeam_score:15,
  awayteam_score:5
)

match_one = Match.create(
  name: "WB N",
  day: "2019-04-14",
  start_time: "16:30",
  game_length: 80 ,
  where: "via del sale 60, Cremona",
  field: "Campo 1",
  hometeam_id: Team.where(name: "CUS Padova Tane Malefiche").first.id,
  awayteam_id: Team.where(name: "CUSB Red Bulle West").first.id,
  event_id: Event.first.id,
  hometeam_score:15,
  awayteam_score:11
)

match_due = Match.create(
  name: "WB N",
  day: "2019-03-17",
  start_time: "9:00",
  game_length: 80 ,
  where: "via Jacopo Corrado 4, Padova",
  field: "Campo 1",
  hometeam_id: Team.where(name: "CUS Padova Tane Malefiche").first.id,
  awayteam_id: Team.where(name: "2DPick").first.id,
  event_id: Event.first.id,
  hometeam_score:15,
  awayteam_score:5
)

match_due = Match.create(
  name: "WB N",
  day: "2019-03-17",
  start_time: "10:30",
  game_length: 80 ,
  where: "via Jacopo Corrado 4, Padova",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Donkey Ladies").first.id,
  awayteam_id: Team.where(name: "Fireflies").first.id,
  event_id: Event.first.id,
  hometeam_score:15,
  awayteam_score:11
)

match_due = Match.create(
  name: "WB N",
  day: "2019-03-17",
  start_time: "12:00",
  game_length: 80 ,
  where: "via Jacopo Corrado 4, Padova",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Hub").first.id,
  awayteam_id: Team.where(name: "CUS Padova Tane Malefiche").first.id,
  event_id: Event.first.id,
  hometeam_score:10,
  awayteam_score:15
)

match_due = Match.create(
  name: "WB N",
  day: "2019-03-17",
  start_time: "13:30",
  game_length: 80 ,
  where: "via Jacopo Corrado 4, Padova",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Donkey Ladies").first.id,
  awayteam_id: Team.where(name: "CUSB Red Bulle West").first.id,
  event_id: Event.first.id,
  hometeam_score:12,
  awayteam_score:15
)

match_due = Match.create(
  name: "WB N",
  day: "2019-03-17",
  start_time: "15:00",
  game_length: 80 ,
  where: "via Jacopo Corrado 4, Padova",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Fireflies").first.id,
  awayteam_id: Team.where(name: "2DPick").first.id,
  event_id: Event.first.id,
  hometeam_score:15,
  awayteam_score:6
)

match_due = Match.create(
  name: "WB N",
  day: "2019-03-17",
  start_time: "16:30",
  game_length: 80 ,
  where: "via Jacopo Corrado 4, Padova",
  field: "Campo 1",
  hometeam_id: Team.where(name: "Hub").first.id,
  awayteam_id: Team.where(name: "CUSB Red Bulle West").first.id,
  event_id: Event.first.id,
  hometeam_score:15,
  awayteam_score:11
)

def points(hometeam_score, awayteam_score)
  if hometeam_score - awayteam_score >= 4
    return 3
  elsif hometeam_score - awayteam_score > 0
    return 2
  elsif hometeam_score - awayteam_score >= -4
    return 1
  else hometeam_score - awayteam_score < -4
    return 0
  end
end


puts 'Creating fake points...'

# n = 1
matches = Match.all
matches.each do |match|

  if match.points?

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

puts 'seed done!'
