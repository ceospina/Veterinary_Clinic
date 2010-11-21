class ChangeMeetings < ActiveRecord::Migration
  def self.up
    remove_column :meetings, :ownerName
    remove_column :meetings, :ownerId
     
    change_table :meetings do |t|
      t.string  :ownerName
      t.integer :ownerId
    end
  end

  def self.down
    remove_column :meetings, :ownerName
    remove_column :meetings, :ownerId
     
    change_table :meetings do |t|
      t.string  :ownerName, :null => false
      t.integer :ownerId, :null => false
    end
  end
end
