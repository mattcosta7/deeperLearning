# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@user1 = User.new(name:"Matthew", email:"matt@mattc.io", password: "123456", password_confirmation: "123456")
@user2 = User.new(name:"Erin", email:"erin@mattc.io", password: "123456", password_confirmation: "123456")
@user1.save
@user2.save

@course = Course.new(name: "Javascript")
@course.save

@challenge = Challenge.new(title: "Chal 1", course_id: 1, lesson: "Stuff to learn", problem: "do this stuff", answer: "this is the answer", hints: "1,2,3,4,5,6", instructions: "do this stuff")
@challenge.save

@challenge2 = Challenge.new(title: "Chal 2", course_id: 1, lesson: "Stuff to learn", problem: "do this stuff", answer: "this is the answer", hints: "1,2,3,4,5,6", instructions: "do this stuff")
@challenge2.save