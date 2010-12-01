require 'spec_helper'

describe User do  
  it "should append first and lastname" do
    user = Factory(:user, :firstname => "Miss", :lastname => "Panda")
    user.should respond_to(:name)
    user.name.should eq "#{user.firstname} #{user.lastname}"
  end
end
