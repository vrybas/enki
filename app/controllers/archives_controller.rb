class ArchivesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @months = Post.find_all_grouped_by_month
  end
end
