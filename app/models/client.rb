class Client < ActiveRecord::Base
	has_many :animals
	validates_presence_of :name,:lastName,:idDocument,:address,:isowner



end
