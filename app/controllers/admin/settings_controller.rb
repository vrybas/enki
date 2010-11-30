class Admin::SettingsController < Admin::BaseController
  def show
    @setting = Setting.find_or_create
  end
  
  def create
    @setting = Setting.new(params[:setting])
    if @setting.save
      redirect_to admin_root_path, :notice => t('.admin.settings.create.successful')
    end
  end
  
  def update
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(params[:setting])
      redirect_to admin_root_path, :notice => t('.admin.settings.update.successful')
    end
  end
end
