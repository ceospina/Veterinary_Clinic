class TypeConsult < ActiveRecord::Base
	has_many :consultas
	validates_uniqueness_of :name
	attr_accessible :name, :description
	validates_presence_of :name,:description
	validates_format_of :name, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  validates_length_of :name, :maximum=>30
  validates_length_of :description, :maximum=>500
	def self.for_select
	 all.collect{|c| [c.name, c.id]}
  end
end
