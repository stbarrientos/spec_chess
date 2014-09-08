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
	{code: "#code should go here", name: "Sample test", status: "new", description: "First test", user_id: users[0].id},
	{code: "#more code here", name: "Test 2", status: "new", description: "Second test", user_id: users[1].id}
])

solutions = Solution.create([
	{code: "#the solution to the first test", status: "new", description: "Solution for first test", test_id: tests[0].id},
	{code: "#solution to the second test", status: "new", description: "Oh god please work", test_id: tests[1].id}
])