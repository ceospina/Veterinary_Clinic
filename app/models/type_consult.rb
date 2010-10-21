class TypeConsult < ActiveRecord::Base
	has_many :consultas
	validates_presence_of :name,:description
	
	def self.for_select
	 all.collect{|c| [c.name, c.id]}
  end
end
