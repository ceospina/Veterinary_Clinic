class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|
		t.string	:name, :null=>false
		t.date		:birthDay
		t.boolean 	:sex, :null=>false #false is female 
		t.string	:description, :null=>false
		t.boolean	:spayed, :default => false #false = no spayed
	    t.string	:diet
		t.integer	:breed_id, :null=>false
		t.integer	:client_id, :null=>false
		t.string	:habitat
	    #t.string	:vaccines
	    #t.string	:allergies
		t.timestamps
    end
  end

  def self.down
    drop_table :animals
  end
end
