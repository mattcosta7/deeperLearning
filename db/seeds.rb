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

@challenge = Challenge.new(title: "DataTypes", course_id: 1, lesson: "In Jellyscript there are many ways to store data.\r\nWe have numbers, strings, arrays, boolean types.\n An number is...\r\n A string can be a sentence, or a single word, denoted by \" \" marks around it. Arrays store sets of things, of any types [1,2,3,4,5], ['hello',1,2,'how are you']\r\n Booleans are true or false. You declare a variable by typing var followed by the name of a variable, then equals then what to set that as, and end the line with a semicolon. \r\nFor Example, var number = 1\r\nsets the variable number equal to one. When we call number, from now on, we'll get 1.", problem: "Declare a variable, 'number' as 10. An array, 'array' as [1,2,3,4,5], a boolean, 'boolean' as true, and a string 'string' as 'hello world'", answer: "var number = 10;\r\nvar array = [1,2,3,4,5];\r\nvar boolean = true;\r\nvar string = 'hello world';", hints: "1,2,3,4,5,6", instructions: "do this stuff")
@challenge.save

@challenge2 = Challenge.new(title: "Maths", course_id: 1, lesson: "In Jellyscript, you can easily perform basic mathematical operations!\r\n You can add by connecting two numbers with a + sign, subtract using -, multiply with *, dividie by \r\n", problem: "write 2+2 in the text editor", answer: "2+2", hints: "", instructions: "do this stuff")
@challenge2.save