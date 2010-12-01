class Admin::SettingsController < Admin::BaseController
  def show
    @setting = Setting.find_or_create
  end
  
  def create
    @setting = Setting.find_or_create
    if @setting.save!
      redirect_to admin_root_path, :notice => t('.admin.settings.create.successful')
    else
      render :show
    end
  end
  
  def update
    @setting = Setting.find_or_create
    if @setting.update_attributes(params[:setting])
      redirect_to admin_root_path, :notice => t('.admin.settings.update.successful')
    else
      render :show
    end
  end
end
