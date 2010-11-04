class Consulta < ActiveRecord::Base
	belongs_to :animal
	belongs_to :doctor
	belongs_to :typeConsult
	validates_presence_of :date,:medicalAlert,:weight,:diagnosis,:temperature,:heartRate,:pulse,:treatment,:typeConsult_id,:animal_id,:doctor_id
	#validates_associated :doctor,:typeConsult
	validates_length_of :medicalAlert, :diagnosis,:treatment, :maximum=>500
	validates_length_of :allergies, :vaccines, :medicalTests, :surgeries, :injuries,:maximum=>500, :allow_nil=>true, :allow_blank=>true
	validates_numericality_of :weight, :temperature, :heartRate,:pulse
   
end
