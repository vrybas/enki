require File.dirname(__FILE__) + '/../spec_helper'

describe PageTitleHelper do
  include PageTitleHelper

  before :each do
    Blog.stub!(:title).and_return("Default Blog Title")
  end

  describe '#posts_title with no tag' do
    it 'is the site title' do
      posts_title(nil).should == "Default Blog Title"
    end
  end

  describe '#posts_title with tag' do
    it 'is the titlelized tag name plus the site title' do
      posts_title("ruby").should == "Ruby - Default Blog Title"
    end
  end

  describe '#post_title' do
    it 'is the post title plus the site title' do
      posts_title("My Post").should == "My Post - Default Blog Title"
    end
  end

  describe '#archives_title' do
    it 'is "Archives" plus the site title' do
      archives_title.should == "Archives - Default Blog Title"
    end
  end

  describe '#page_title' do
    it 'is the page title plus the site title' do
      posts_title("My Page").should == "My Page - Default Blog Title"
    end
  end
end
