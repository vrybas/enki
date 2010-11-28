require 'spec_helper'

describe User do
  it(:user) { Factory(:user, :firstname => "Miss", :lastname => "Panda")}
  
  it "should append first and lastname" do
    user.should respond_to(:name)
    user.name.should eq "Miss Panda"
  end
end
