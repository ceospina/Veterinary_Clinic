class ChangeHoraries < ActiveRecord::Migration
  def self.up
    
    remove_column :horaries, :startTime
    remove_column :horaries, :finalHour
    
    change_table :horaries do |t|
      t.datetime  :startTime
      t.datetime  :finalHour
    end
    
   
     
  end

  def self.down
    remove_column :horaries, :startTime
    remove_column :horaries, :finalHour
     
    change_table :horaries do |t|
      t.time  :startTime
      t.time  :finalHour
    end
    
  end
end
