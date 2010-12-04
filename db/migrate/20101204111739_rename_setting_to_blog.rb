class RenameSettingToBlog < ActiveRecord::Migration
  def self.up
    rename_table :blogs, :blogs
  end

  def self.down
    rename_table :blogs, :blogs
  end
end
