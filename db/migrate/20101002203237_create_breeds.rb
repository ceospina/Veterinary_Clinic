class CreateBreeds < ActiveRecord::Migration
  def self.up
    create_table :breeds do |t|
		t.string	:name, :null=>false
		t.string	:description, :null=>false
		t.integer	:specie_id, :null=>false
		t.timestamps
    end
  end

  def self.down
    drop_table :breeds
  end
end
