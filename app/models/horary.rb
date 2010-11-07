class Horary < ActiveRecord::Base
	belongs_to :doctor
	validates_presence_of :day,:startTime,:finalHour,:doctor_id
  validates_time :startTime, :on_or_after => '6:00am', :before => '5:00pm',:format=>'h:nn_ampm'
  validates_time :finalHour, :after => :startTime, :before => '5:00pm',:format=>'h:nn_ampm'

end
