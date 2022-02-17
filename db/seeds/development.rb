# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_admin=User.create(email: "admin@mailo.com",
                       password: "000000aB",
                       password_confirmation: "000000aB",
                       name: "Admin",
                       firstname: "Moi,",
                       birthday: "1982-01-27",
                       admin: true,
                       teacher: false,
                       questioner: false)
user_teacher=User.create(email: "teacher@mailo.com",
                       password: "000000aB",
                       password_confirmation: "000000aB",
                       name: "Teacher",
                       firstname: "Moi,",
                       admin: false,
                       teacher: true,
                       questioner: false)
user_questioner=User.create(email: "questioner@mailo.com",
                       password: "000000aB",
                       password_confirmation: "000000aB",
                       name: "Questioner",
                       firstname: "Moi,",
                       admin: false,
                       teacher: false,
                       questioner: true)
user1=User.create(email: "user1@mailo.com",
                       password: "000000aB",
                       password_confirmation: "000000aB",
                       name: "Pupil1",
                       firstname: "Moi1,",
                       admin: false,
                       teacher: false,
                       questioner: false)
user2=User.create(email: "user2@mailo.com",
                       password: "000000aB",
                       password_confirmation: "000000aB",
                       name: "Pupil2",
                       firstname: "Moi2,",
                       admin: false,
                       teacher: false,
                       questioner: false)
#group_pcsi=Group.create(name:"PCSI")
#group_pcsi.pupils << user1
#room_physique=Room.create(name:"Physique")
#room_maths=Room.create(name:"Maths")
#RoomGroupRight.create(group:group_pcsi,room:room_physique)
#RoomUserRight.create(user:user_teacher,room:room_physique,view:true,post:true)
