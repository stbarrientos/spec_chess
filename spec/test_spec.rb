require 'spec_helper'
require './app/controllers/sam/test.rb'
#code should go here

describe Person do
    
    let(:person) {Person.new("Sam")}
   
    it "has a name" do
        expect(person.name).to eq("Sam") 
    end
    
    it "starts with an age of 0" do
        expect(person.age).to eq(1) 
    end
end