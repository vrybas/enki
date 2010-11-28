class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :username
  
  validates :firstname, :lastname, :username, :presence => true
  validates :username, :uniqueness => true
  
  def name
    [firstname, lastname].join(" ")
  end
  
  class << self
    def current
      @current_user
    end
    
    def current=(user)
      @current_user = user
    end
    
    def current?
      @current_user.present
    end
  end
end
