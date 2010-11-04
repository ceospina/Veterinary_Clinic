class Breed < ActiveRecord::Base
	has_many :animals
	belongs_to :specie
	validates_associated :specie
	validates_presence_of :name,:description,:specie_id
	validates_format_of :name, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  validates_length_of :name, :maximum=>30
  validates_length_of :description, :maximum=>500
	def self.for_select
   all.collect{|c| [c.name, c.id]}
  end
		
end
