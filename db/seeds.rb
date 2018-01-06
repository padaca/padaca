# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []

admin = Account.create! email: 'admin@padaca.de', password: 'topsecret', password_confirmation: 'topsecret', istMitarbeiter: true
fahrt = Fahrt.create! account: admin, von: :Berlin, nach: :Paderborn

10.times do |i|

  user = Account.create! email: "user#{i}@padaca.de", password: 'topsecret', password_confirmation: 'topsecret'

  Fahrt.create! account: user, von: :Paderborn, nach: :Berlin
  Mitfahrer.create! fahrt: fahrt, account: user

  users.push user

end
