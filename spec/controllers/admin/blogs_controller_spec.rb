require 'spec_helper'

describe Admin::BlogsController do
  describe 'handling GET to show' do
    before :each do
      login_user
      get :show
    end
    
    it('is successful')         { response.should be_success }
    it('renders show page')     { response.should render_template('show') }
    
    describe 'without any blogs available' do
      it('creates a new blog') { assigns[:blog].new_record? == true }
    end
    
    describe 'with blogs available' do
      @blog = Factory(:blog)
      it('retrieves it from the database') { assigns[:blog] == @blog }
    end
  end
  
  describe 'handling PUT to update with valid attributes' do
    before :each do
      @blog = Factory(:blog)
      @blog.stub!(:update_attributes).and_return true
      Blog.stub!(:find).and_return(@blog)
      
      @attributes = {"title" => "Some title", "description" => "Some description"}
    end
    
    def do_put
      login_user
      put :update, :id => 1, :blog => @attributes
    end
    
    it('redirects to admin#dashboard') do
      do_put
      response.should be_redirect
      response.should redirect_to(admin_root_path)
    end
    
    it('updates the blog blogs') do
      @blog.should_receive(:update_attributes).with(@attributes).and_return(true)
      do_put
    end
    
    it('puts a flash message') do
      do_put
      flash[:notice].should_not be_blank
    end
  end
  
  describe 'handling POST to create with valid attributes' do
    before :each do
      @blog = Factory(:blog)
      @blog.stub!(:save).and_return true
      Blog.stub!(:find_or_create).and_return @blog
      
      @attributes = {'title' => 'Some title', 'description' => 'Some description'}
    end
    
    def do_post
      login_user
      post :create, :blog => @attributes
    end
    
    it('redirects to admin#dashboard') do
      do_post
      response.should be_redirect
      response.should redirect_to admin_root_path
    end
    
    it('saves the blogs settings') do
      @blog.should_receive(:save).and_return(@blog)
      do_post
    end
    
    it('puts a flash message') do
      do_post
      flash[:notice].should_not be_blank
    end
  end
end
