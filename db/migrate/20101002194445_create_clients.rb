class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
		t.string	:name,  :null=> false
		t.string	:lastName, :null=> false
		t.integer	:idDocument, :null=>false
		t.string	:email
		t.integer	:phoneHome
		t.integer	:phoneCell
		t.integer	:phoneWork
		t.string	:address, :null=>false
		t.integer	:town_id
		t.boolean	:isowner, :default=>true
		  #---chat--------------------------------------
	    t.string	:userName
	    t.string	:password
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
