class Breed < ActiveRecord::Base
	has_many :animals
	belongs_to :specie
	validates_associated :specie
	validates_presence_of :name,:description,:specie_id
		
end
