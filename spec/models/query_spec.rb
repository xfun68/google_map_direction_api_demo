require 'spec_helper'
require 'query'

describe Query do

  START_ADDRESS = "钟楼 西安"
  END_ADDRESS = "鼓楼 西安"

  before(:each) do
    @attr = { "start_address" => START_ADDRESS, "end_address" => END_ADDRESS }
  end

  it "should create a new instance given valid attributes" do
    Query.new @attr
  end

  it "should get right start_address" do
    query = Query.new @attr
    query.start_address.should == START_ADDRESS
  end

  it "should get right end_address" do
    query = Query.new @attr
    query.end_address.should == END_ADDRESS
  end

  it "should require a start_address" do
    query = Query.new @attr.merge("start_address" =>  "")
    query.should be_invalid
  end

  it "should require a end_address" do
    query = Query.new @attr.merge("end_address" =>  "")
    query.should be_invalid
  end

  it "should reject start_address that is too long" do
    query = Query.new @attr.merge("start_address" =>  "x" * 31)
    query.should be_invalid
  end

  it "should reject end_address that is too long" do
    query = Query.new @attr.merge("end_address" =>  "x" * 31)
    query.should be_invalid
  end
end
