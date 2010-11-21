class AddColumnUsers < ActiveRecord::Migration
  def self.up
     change_table :users do |t| 
      t.string :first_name 
      t.string  :last_name
    end 
    #Animal.update_all ["sex = ?", false] 
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name 
  end
end
