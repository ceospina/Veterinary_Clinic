class Animal < ActiveRecord::Base
	belongs_to :breed
	belongs_to :client
	has_many :consultas
	validates_associated :consultas,:client,:breed
	has_many :doctors, :through => :consultas 
	validates_presence_of :sex, :description, :breed_id, :client_id, :name
	
	def self.for_select
	 all.collect{|c| [c.name, c.id]}
	end
	
end
