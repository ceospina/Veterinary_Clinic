class Animal < ActiveRecord::Base
	belongs_to :breed, :foreign_key=>'breed_id'
	belongs_to :client
	has_many :consultas
	validates_associated :consultas, :breed
	#validates_associated :client
	has_many :doctors, :through => :consultas 
	validates_presence_of :description, :breed_id, :client_id, :name
	validates_format_of :name, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
	validates_length_of :name, :maximum=>30
	validates_length_of :description, :maximum=>500
  validates_length_of :habitat, :maximum=>30,:allow_nil=>true, :allow_blank=>true
    
	def self.for_select
	 all.collect{|c| [c.name, c.id]}
	end
	
end
