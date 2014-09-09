require 'spec_helper'
require_relative '../app/controllers/sam/test.rb'

describe Person do
    it "should have a name"
    expect(Person.new.name).to eq("Sam")
end