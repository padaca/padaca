# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []

admin = Account.create! email: 'admin@padaca.de', password: 'topsecret', password_confirmation: 'topsecret', istMitarbeiter: true
fahrt = Fahrt.create! account: admin, von: :Berlin, nach: :Paderborn, abfahrt: 3.days.from_now

10.times do |i|

  user = Account.create! email: "user#{i}@padaca.de", password: 'topsecret', password_confirmation: 'topsecret'

  user_fahrt = Fahrt.create! account: user, von: :Paderborn, nach: :Berlin, abfahrt: 2.days.from_now

  Mitfahrer.create! fahrt: fahrt, account: user
  Mitfahrer.create! fahrt: user_fahrt, account: admin

  Nachricht.create! sender: admin, empfaenger: user, nachricht: "Hello,\ni am root!\n\nGreetings,\nAdmin."
  Nachricht.create! sender: user, empfaenger: admin, nachricht: "Hello,\ni am user!\n\nGreetings,\nUser #{i}."

  users.push user

end
