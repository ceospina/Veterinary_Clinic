class Specie < ActiveRecord::Base
	has_many :breeds
	validates_presence_of :name,:description
	
end
