class Breed < ActiveRecord::Base
	has_many :animals
	attr_accessible :name, :description, :specie_id
	validates_uniqueness_of :name
	belongs_to :species, :foreign_key=>'specie_id'
	validates_associated :species
	validates_presence_of :name,:description,:specie_id
	validates_format_of :name, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  validates_length_of :name, :maximum=>30
  validates_length_of :description, :maximum=>500
	def self.for_select
   all.collect{|c| [c.name, c.id]}
  end
	

	def self.for_specie(specie)
	  joins(:species).where("species.name LIKE ?", "%#{specie}%")
	end
	
	def self.for_name(name)
	  where("name LIKE ?", "%#{name}%")
	end
	
	def self.for_name_and_specie(name,specie)
	  joins(:species).where("species.name LIKE ? and breeds.name LIKE ?", "%#{specie}%","%#{name}%" )
	end
	
	def self.search(name,specie)
	  r=joins(:species).where("species.name LIKE ?", "%#{specie}%") unless specie.empty? or name.present?
	  r=where("name LIKE ?", "%#{name}%") unless name.empty? or specie.present?  
	  r=joins(:species).where("species.name LIKE ? and breeds.name LIKE ?", "%#{specie}%","%#{name}%" ) unless name.empty? or specie.empty? 
	  return r||=[]
	end
	
end
