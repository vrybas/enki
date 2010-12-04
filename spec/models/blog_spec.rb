require 'spec_helper'

describe Blog do
  describe "calling find_or_create" do
    it "should, when failing to find one, create a new blog" do
      blog = Blog.find_or_create
      blog.new_record?.should == true
    end
    
    it "should, when finding one, return the record" do
      blog = Factory(:blog)
      blog.new_record?.should == false
    end
  end
  
  describe "global blogs" do
    it("should respond to new_blog?")     { Blog.should respond_to(:new_blog?)}
    it("should respond to blog title")    { Blog.should respond_to(:title) }
    it("should respond to title")         { Blog.should respond_to(:description) }
    it("should respond to show fork")     { Blog.should respond_to(:show_fork) }
    
    describe "without any blogs available" do
      it("should have defaults") do
        Blog::DEFAULTS.should_not be_nil
        Blog::DEFAULTS[:title].should_not be_nil
        Blog::DEFAULTS[:description].should_not be_nil
        Blog::DEFAULTS[:show_fork].should_not be_nil
      end
      
      it("should identify as a new blog")         { Blog.new_blog?.should == true }
      it("should return a default title")         { Blog.title.should == Blog::DEFAULTS[:title] }  
      it("should return a default description")   { Blog.description.should == Blog::DEFAULTS[:description] }
      it("should return true for show_fork")      { Blog.show_fork.should == true}
    end
    
    describe "with blogs available" do
      before(:each) { @blog = Factory(:blog, :title => "Agile Pandas", :description => "Panda Description", :show_fork => true)}
      
      it("shouldn't identify as a new blog"){ Blog.new_blog?.should == false }
      it("should return your title")        { Blog.title.should == @blog.title }
      it("should return your description")  { Blog.description.should == @blog.description }
      it("should return your show_fork")    { Blog.show_fork.should == @blog.show_fork }
    end
  end 
end
