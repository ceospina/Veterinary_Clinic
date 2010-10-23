class Breed < ActiveRecord::Base
	has_many :animals
	belongs_to :specie
	validates_associated :specie
	validates_presence_of :name,:description,:specie_id
	
	def self.for_select
   all.collect{|c| [c.name, c.id]}
  end
		
end
