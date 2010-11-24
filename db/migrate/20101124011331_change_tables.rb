class ChangeTables < ActiveRecord::Migration
  def self.up
    remove_column :clients,:userName
    remove_column :clients,:password
    remove_column :clients,:town_id
    remove_column :clients,:idDocument
    remove_column :clients,:phoneHome
    remove_column :clients,:phoneCell
    remove_column :clients,:phoneWork
    change_table :clients do |t|
      t.string :idDocument
      t.string :phoneHome
      t.string :phoneCell
      t.string :phoneWork
    end
  end

  def self.down
   
    add_column :clients,:userName, :string
    add_column :clients,:password, :string
    add_column :clients,:town_id, :integer
    remove_column :clients,:idDocument
    remove_column :clients,:phoneHome
    remove_column :clients,:phoneCell
    remove_column :clients,:phoneWork
   
    change_table :clients do |t|
      t.integer :idDocument, :null=> false  
      t.integer :phoneHome
      t.integer :phoneCell
      t.integer :phoneWork
    end
    
  end
end
