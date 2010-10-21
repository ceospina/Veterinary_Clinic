class Horary < ActiveRecord::Base
	belongs_to :doctor
	validates_presence_of :day,:startTime,:finalHour,:doctor_id
	 
end
