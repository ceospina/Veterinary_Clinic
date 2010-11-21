class Meeting < ActiveRecord::Base
	belongs_to :doctor
	attr_accessible :ownerNarme, :ownerId, :meetingDate, :meetingHour, :doctor_id
	validates_presence_of :meetingDate,:meetingHour,:doctor_id
	validates_format_of :ownerName,:with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i, :allow_blank=>true, :allow_nil=>true
  validates_length_of :ownerName, :maximum=>30 , :allow_blank=>true, :allow_nil=>true
	validates_numericality_of :ownerId, :allow_blank=>true, :allow_nil=>true
	validates_length_of :ownerId, :in=> 7..10, :allow_blank=>true, :allow_nil=>true
end
