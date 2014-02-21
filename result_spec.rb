require 'rspec'
require File.join(File.dirname(__FILE__), 'result.rb')

describe Result do
  before(:each) do
    Result.destroy_all
  end
  describe "update" do
    it "should add all results if no existing results" do
      Result.update(["1","2","3","4"])
      Result.all.collect {|r| r.number}.should == ["1","2","3","4"]
    end
    it "should add a new result if only one" do
      ["1","2","3","4","5","6"].each do |n|
        Result.create!(:number => n)
      end
      Result.update(["1","2","3","4","5","6","7"])
      Result.all.collect {|r| r.number}.should == ["1","2","3","4","5","6","7"]
    end
    it "should create nothing if no new numbers" do
      ["1","2","3","4","5","6","7"].each do |n|
        Result.create!(:number => n)
      end
      Result.update(["1","2","3","4","5","6","7"])
      Result.all.collect {|r| r.number}.should == ["1","2","3","4","5","6","7"]
    end
    it "should create 2 new numbers" do
      ["1","2","3","4","5"].each do |n|
        Result.create!(:number => n)
      end
      Result.update(["2","3","4","5","6","7"])
      Result.all.collect {|r| r.number}.should == ["1","2","3","4","5","6","7"]
    end
    it "should create all new numbers" do
      ["1","2","3","4","5"].each do |n|
        Result.create!(:number => n)
      end
      Result.update(["6","7","8","9","10"])
      Result.all.collect {|r| r.number}.should == ["1","2","3","4","5","6","7","8","9","10"]
    end
  end
end