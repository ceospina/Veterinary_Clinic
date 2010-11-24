class ChangeTableDoctors < ActiveRecord::Migration
   def self.up
    remove_column :doctors,:userName
    remove_column :doctors,:password

    remove_column :doctors,:idDocument
    remove_column :doctors,:phoneHome
    remove_column :doctors,:phoneCell

    change_table :doctors do |t|
      t.string :idDocument
      t.string :phoneHome
      t.string :phoneCell
    end
  end

  def self.down
   
    add_column :doctors,:userName,:password, :string

    remove_column :doctors,:idDocument
    remove_column :doctors,:phoneHome
    remove_column :doctors,:phoneCell

    change_table :doctors do |t|
      t.integer :idDocument, :null=>false
      t.integer :phoneHome, :integer
      t.integer :phoneCell, :integer
    end
    
  end
end
