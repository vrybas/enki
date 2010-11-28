class Admin::BaseController < ApplicationController
  protected

  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end
end
