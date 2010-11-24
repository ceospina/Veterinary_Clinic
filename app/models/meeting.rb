class Meeting < ActiveRecord::Base
	belongs_to :horary
	attr_accessible :ownerName, :ownerId, :meetingDate, :meetingHour, :horary_id
	validates_presence_of :meetingDate,:meetingHour,:horary_id
	validates_presence_of :ownerName, :ownerId, :on => 'update'
	validates_format_of :ownerName,:with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i, :on=>'update'
  validates_length_of :ownerName, :maximum=>30 , :on=>'update'
	validates_numericality_of :ownerId, :on=>'update'
	#validates_length_of :ownerId, :in=> 7..10, :allow_blank=>true, :allow_nil=>true
end
