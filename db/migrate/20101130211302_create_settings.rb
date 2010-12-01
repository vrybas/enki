class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end