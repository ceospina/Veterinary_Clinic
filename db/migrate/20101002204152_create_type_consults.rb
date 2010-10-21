class CreateTypeConsults < ActiveRecord::Migration
  def self.up
    create_table :type_consults do |t|
		t.string		:name, :null=>false
		t.string		:description, :null=>false
		t.timestamps
    end
  end

  def self.down
    drop_table :type_consults
  end
end
