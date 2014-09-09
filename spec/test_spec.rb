require 'spec_helper'
require_relative "../app/controllers/sam/test.rb"
describe Test do
let(:test) {Test.new("Sam")}
describe "#initialize" do
it "has a name" do
expect(test.name).to eq("Sam")
end
end
end