class ChangeReferencesHorary < ActiveRecord::Migration
  def self.up
    remove_column :meetings, :doctor_id

    
    change_table :meetings do |t|
      t.references  :horary      
    end
  end

  def self.down
   
    remove_column :meetings, :horary_id
     
    change_table :meetings do |t|
      t.references :doctor
    end
  end
end
