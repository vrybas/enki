require 'spec_helper'

describe Setting do
  describe "calling find_or_create" do
    it "should, when failing to find one, create a new setting" do
      setting = Setting.find_or_create
      setting.new_record?.should == true
    end
    
    it "should, when finding one, return the record" do
      setting = Factory(:setting)
      setting.new_record?.should == false
    end
  end
  
  describe "global settings" do
    it("should respond to blog title")         { Setting.should respond_to(:blog_title) }
    it("should respond to blog_title")         { Setting.should respond_to(:description) }
    
    describe "without any settings available" do
      it("should have defaults") do
        Setting::DEFAULTS.should_not be_nil
        Setting::DEFAULTS[:title].should_not be_nil
        Setting::DEFAULTS[:description].should_not be_nil
      end
      
      it("should return a default title")        { Setting.blog_title.should == Setting::DEFAULTS[:title] }  
      it("should return a default description")  { Setting.description.should == Setting::DEFAULTS[:description] }
    end
    
    describe "with settings available" do
      before(:each) { @setting = Factory(:setting, :title => "Agile Pandas", :description => "Panda Description")}
      it("should return your title")       { Setting.blog_title.should == @setting.title }
      it("should return your description") { Setting.description.should == @setting.description }
    end
  end 
end
