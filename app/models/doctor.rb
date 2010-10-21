class Doctor < ActiveRecord::Base
	has_many :consultas
	has_many :horaries
	has_many :meetings
	validates_associated :meetings,:horaries
	has_many :animals, :through => :consultas
	validates_presence_of :name,:lastName,:idDocument,:speciality,:address
	
	def self.for_select
	 all.collect{|c| [c.name, c.id]}
  end
end
