require 'spec_helper'

describe Routes do

  describe "founded" do

    before(:all) do 
      @json_result = ''
      File.open("spec/data/search_results_happy.json") { |f| f.each_line { |line| @json_result += line } }
      @routes = Routes.new(@json_result)
    end

    it "should get correct status OK" do
      @routes.status.should == "OK"
    end

    it "should get correct detailed start address" do
      @routes.detailed_start_address.should == "西安钟楼, East St, Beilinqu, Xi'an, Shaanxi, China"
    end

    it "should get correct detailed end address" do
      @routes.detailed_end_address.should == "China Shaanxi Xi'an Beilinqu鼓楼"
    end

    it "should get correct distance" do
      @routes.distance.should == "0.6 km"
    end

    it "should get correct duration" do
      @routes.duration.should == "1 min"
    end

    describe "steps" do

      before(:all) do 
      end

      it "should get correct steps number" do
        @routes.steps.count.should == 2
      end

      it "should have instructions" do
        @routes.steps.each do |step|
          step.should =~ /^\[.*\] \[.*\] .*$/i
        end
      end
    end
  end

  describe "NOT founded" do

    before(:all) do 
      @json_result = ''
      File.open("spec/data/search_results_sad.json") { |f| f.each_line { |line| @json_result += line } }
      @routes = Routes.new(@json_result)
    end

    it "should NOT get status OK" do
      @routes.status.should_not == "OK"
    end
  end
end
