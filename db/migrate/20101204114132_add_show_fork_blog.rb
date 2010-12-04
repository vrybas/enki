class AddShowForkBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :show_fork, :boolean, :default => true
  end

  def self.down
    remove_column :blogs, :show_fork
  end
end
