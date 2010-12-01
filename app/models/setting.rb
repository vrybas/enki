class Setting < ActiveRecord::Base
  DEFAULTS = {:title => "Default Blog Title", :description => "Default blog description"}
  
  validates :title, :description, :presence => true
  
  class << self
    def find_or_create
      (find(:first) || new)
    end
    
    def blog_title
      (find(:first).try(:title) || DEFAULTS[:title])
    end
    
    def description
      (find(:first).try(:description) || DEFAULTS[:description])
    end
  end
end
