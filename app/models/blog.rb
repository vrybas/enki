class Blog < ActiveRecord::Base
  DEFAULTS = {
    :title          => "Default Blog Title", 
    :description    => "Default blog description",
    :show_fork      => true}
  
  validates :title, :description, :presence => true
  
  class << self
    attr_accessor :blog
    
    def new_blog?
      count == 0 ? true : false
    end
    
    # TODO This needs to be refactored
    def find_or_create
      (find(:first) || new)
    end
    
    def title
      (find(:first) || Blog.new(:title => DEFAULTS[:title])).try(:title)
    end
    
    def description
      (find(:first) || Blog.new(:description => DEFAULTS[:description])).try(:description)
    end
    
    def show_fork
      (find(:first) || Blog.new(:show_fork => DEFAULTS[:show_fork])).try(:show_fork)
    end
  end
end
