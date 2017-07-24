[User, Trip, Leg, Comment].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end


alex = User.create!(
  username: "CatLady666",
  firstname: "Alex",
  lastname: "Cwiek",
  email: "alex@alex.com",
  bio: "likes cats",
  password: "password"
)
nick = User.create!(
  username: "KabanosBoy666",
  firstname: "Nick",
  lastname: "Cresner",
  email: "nick@nick.com",
  bio: "likes kabanosy and pierogi",
  password: "password"
)


bosnia = Trip.create!(name: "Alex annihilates borek in Bosnia", country: "Bosnia and Herzegovina", user: alex, attendees:[alex, nick])

japan = Trip.create!(name: "Nick rolls sushi in Sapporo", country: "Japan", user: nick, attendees:[alex, nick])

bosnia_leg_1 = Leg.create!(trip: bosnia, lat: 23.2434, lng: 23.4334, name: "Sarajevo")
bosnia_leg_2 = Leg.create!(trip: bosnia, lat: 24.2434, lng: 23.4334, name: "Mostar")

japan_leg_1 = Leg.create!(trip: japan, lat: 23.2434, lng: 23.4334, name: "Sapporo")
japan_leg_2 = Leg.create!(trip: japan, lat: 24.2434, lng: 23.4334, name: "Tokyo")

comment1 = Comment.create!(
  body: "Wow! Mostar Bridge is beautiful, I cant wait to jump off it",
  user: alex,
  trip: bosnia
)
comment2 = Comment.create!(
  body: "Please be careful!",
  user: nick,
  trip: bosnia
)
comment3 = Comment.create!(
  body: "Sayonara",
  user: alex,
  trip: japan
)
comment4 = Comment.create!(
  body: "You say ari-gato like we say ari-gato",
  user: nick,
  trip: japan
)
