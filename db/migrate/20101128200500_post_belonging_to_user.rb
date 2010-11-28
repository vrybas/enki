class PostBelongingToUser < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
  end

  def self.down
    drop_column :posts, :user_id
  end
end
