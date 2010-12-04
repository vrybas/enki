class Admin::BlogsController < Admin::BaseController
  def show
    @blog = Blog.find_or_create
  end
  
  def create
    @blog = Blog.find_or_create
    if @blog.save
      redirect_to admin_root_path, :notice => t('.admin.blogs.create.successful')
    else
      render :show
    end
  end
  
  def update
    @blog = Blog.find_or_create
    if @blog.update_attributes(params[:blog])
      redirect_to admin_root_path, :notice => t('.admin.blogs.update.successful')
    else
      render :show
    end
  end
end
