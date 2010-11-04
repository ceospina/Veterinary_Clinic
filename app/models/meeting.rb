class Meeting < ActiveRecord::Base
	belongs_to :doctor
	validates_presence_of :ownerName, :ownerId,:meetingDate,:meetingHour,:doctor_id
	validates_format_of :ownerName,:with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  validates_length_of :ownerName, :maximum=>30
	validates_numericality_of :ownerId
	validates_length_of :ownerId, :in=> 7..10
end
