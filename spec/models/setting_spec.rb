require 'spec_helper'

describe Setting do
  describe "calling find_or_create" do
    it "should when failing to find one create a new setting" do
      setting = Setting.find_or_create
      setting.new_record?.should == true
    end
    
    it "should when finding one return the record" do
      setting = Factory(:setting)
      setting.new_record?.should == false
    end
  end
end
