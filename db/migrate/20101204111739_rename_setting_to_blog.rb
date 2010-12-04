class RenameSettingToBlog < ActiveRecord::Migration
  def self.up
    rename_table :settings, :blogs
  end

  def self.down
    rename_table :blogs, :settings
  end
end
