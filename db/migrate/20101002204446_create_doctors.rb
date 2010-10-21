class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
		t.string	:name,  :null=> false
		t.string	:lastName, :null=> false
		t.integer	:idDocument, :null=>false
		t.string	:email
		t.integer	:phoneHome
		t.integer	:phoneCell
		t.string	:speciality, :null=>false
		t.string	:address, :null=>false
		#---chat--------------------------------------
	    t.string	:userName
	    t.string	:password
		t.timestamps
    end
  end

  def self.down
    drop_table :doctors
  end
end
