require 'spec_helper'

describe Admin::SettingsController do
  describe 'handling GET to show' do
    before :each do
      login_user
      get :show
    end
    
    it('is successful')         { response.should be_success }
    it('renders show page')     { response.should render_template('show') }
    
    describe 'without any settings available' do
      it('creates a new setting') { assigns[:setting].new_record? == true }
    end
    
    describe 'with settings available' do
      @setting = Factory(:setting)
      it('retrieves it from the database') { assigns[:setting] == @setting }
    end
  end
  
  describe 'handling PUT to update with valid attributes' do
    before :each do
      @setting = Factory(:setting)
      @setting.stub!(:update_attributes).and_return true
      Setting.stub!(:find).and_return(@setting)
      
      @attributes = {"title" => "Some title", "description" => "Some description"}
    end
    
    def do_put
      login_user
      put :update, :id => 1, :setting => @attributes
    end
    
    it('redirects to admin#dashboard') do
      do_put
      response.should be_redirect
      response.should redirect_to(admin_root_path)
    end
    
    it('updates the blog settings') do
      @setting.should_receive(:update_attributes).with(@attributes).and_return(true)
      do_put
    end
    
    it('puts a flash message') do
      do_put
      flash[:notice].should_not be_blank
    end
  end
  
  describe 'handling POST to create with valid attributes' do
    before :each do
      @setting = Setting.new
      @setting.stub!(:save).and_return true
      Setting.stub!(:new).and_return @setting
      
      @attributes = {'title' => 'Some title', 'description' => 'Some description'}
    end
    
    def do_post
      login_user
      post :create, :setting => @attributes
    end
    
    it('redirects to admin#dashboard') do
      do_post
      response.should be_redirect
      response.should redirect_to admin_root_path
    end
    
    it('updates the bolg settings') do
      Setting.should_receive(:new).with(@attributes).and_return(@setting)
      do_post
    end
    
    it('puts a flash message') do
      do_post
      flash[:notice].should_not be_blank
    end
  end
end
