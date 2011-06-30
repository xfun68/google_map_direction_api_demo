require "spec_helper"
require "google_directions"

describe GoogleDirections do
  include GoogleDirections

  describe 'valid places' do

    before(:all) do
      @json_result = search_routes("钟楼 西安", "鼓楼 西安");
      @hash_result = ActiveSupport::JSON.decode(@json_result)
      @routes = @hash_result["routes"][0]["legs"][0]
    end

    it "should return 'OK' status" do
      @hash_result["status"].should == "OK"
    end

    it "should return detailed start address" do
      @routes["start_address"].should_not be_blank
    end

    it "should return detailed end address" do
      @routes["end_address"].should_not be_blank
    end

    it "should return distance" do
      @routes["distance"]["text"].should_not be_blank
      @routes["distance"]["value"].should_not be_blank
    end

    it "should return duration" do
      @routes["duration"]["text"].should_not be_blank
      @routes["duration"]["value"].should_not be_blank
    end

    it "should return duration" do
      @routes["steps"].count.should > 0
    end
  end

  describe 'invalid places' do

    before(:all) do
      @json_result = search_routes("", "xxxxxx");
      @hash_result = ActiveSupport::JSON.decode(@json_result)
    end

    it "should return 'FAILED' status" do
      @hash_result["status"].should_not == "OK"
    end
  end
end
