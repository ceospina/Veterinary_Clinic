class AddDefaultSex < ActiveRecord::Migration
  def self.up
   # remove_column :animals, :sex 
    
  end 
  
  def self.down     
   #  change_table :animals do |t| 
   #   t.boolean :sex, :default => false 
   # end 
   # Animal.update_all ["sex = ?", false] 
  end 
 

 
end
