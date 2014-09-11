require 'spec_helper'
require_relative '../../app/models/user.rb'

describe User do
	let(:user) {User.new(name: "Sam", email: "sam@test.com", encrypted_password: "$2a$10$BZoX6VcIqtIjb.xEpQKggehueRky1IaFS2.NRXq5S7xCeJHaK4ErO")}
	let(:user2) {User.new(name: "Paul", email: "paul@test.com", encrypted_password: "$2a$10$BZoX6VcIqtIjb.xEpQKggehueRky1IaFS2.NRXq5S7xCeJHaK4ErO")}
	let(:collab) {Collaboration.new(collaborator_id: user2.id, user_id: user.id)}

	describe "#collaborating_with" do

		expect(user.collaborating_with(user2)).to eq(true)

	end


end