class Consulta < ActiveRecord::Base
	belongs_to :animal
	belongs_to :doctor
	belongs_to :typeConsult
	validates_presence_of :date,:medicalAlert,:weight,:diagnosis,:temperature,:heartRate,:pulse,:treatment,:typeConsult_id,:animal_id,:doctor_id
	validates_associated :doctor,:typeConsult
	  
end
