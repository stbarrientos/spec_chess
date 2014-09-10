require 'spec_helper'
require './app/controllers/sam/test.rb'
describe Person do
   
    let(:person) {Person.new("Sam")}
    
    it "has a name" do
        expect(person.name).to eq("Sam") 
    end
end