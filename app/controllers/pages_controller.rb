class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def show
    @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
  end
end
