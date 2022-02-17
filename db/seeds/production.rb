# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_admin=User.create(email: "admin@mailo.com",
                       password: "000000Ab",
                       password_confirmation: "000000Ab",
                       name: "Admin",
                       firstname: "",
                       birthday: "1982-01-27",
                       admin: true,
                       teacher: false,
                       questioner: false)
user_test=User.create(email: "test@mailo.com",
                       password: "000000Ab",
                       password_confirmation: "000000Ab",
                       name: "Test",
                       firstname: "",
                       birthday: "1982-01-27",
                       admin: true,
                       teacher: false,
                       questioner: false)
