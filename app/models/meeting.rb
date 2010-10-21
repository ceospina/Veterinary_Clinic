class Meeting < ActiveRecord::Base
	belongs_to :doctor
	validates_presence_of :ownerName, :ownwerId,:meetingDate,:meetingHour,:doctor_id
	
	
	
end
