class Setting < ActiveRecord::Base
  class << self
    def find_or_create
      (find(:first) || new)
    end
  end
end
