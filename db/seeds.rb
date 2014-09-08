# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Test.delete_all
Solution.delete_all

users = User.create([
	{name: "Sam", email:"stbarrientos@gmail.com", password: "password", password_confirmation: "password"},
	{name: "Paul", email: "paul@miller.com", password: "password", password_confirmation: "password"}
])

tests = Test.create([
	{code: "#code should go here", name: "Sam's test", status: "new", description: "First test", user_id: users[0].id},
	{code: "#more code here", name: "Paul's Test", status: "new", description: "Second test", user_id: users[1].id}
])

solutions = Solution.create([
	{code: "#the solution to the first test", status: "new", description: "Sam's solution for Sam's test", test_id: tests[0].id, user_id: users[0].id},
	{code: "#solution to the second test", status: "new", description: "Sam's solution for Paul's test", test_id: tests[1].id,user_id: users[0].id},
	{code: "#solution to the third test", status: "new", description: "Paul's solution for Sam's test", test_id: tests[0].id,user_id: users[1].id},
	{code: "#solution to the fourth test", status: "new", description: "Paul's solution for Paul's test", test_id: tests[1].id,user_id: users[1].id}
])