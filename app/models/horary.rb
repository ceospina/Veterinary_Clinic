class Horary < ActiveRecord::Base
	belongs_to :doctor
	attr_accessible :day,:startTime, :finalHour, :doctor_id
	validates_presence_of :day,:startTime,:finalHour,:doctor_id
  validates_time :startTime, :on_or_after => '6:00am', :before => '5:00pm',:format=>'h:nn_ampm'
  validates_time :finalHour, :after => :startTime, :before => '5:00pm',:format=>'h:nn_ampm'
  validates_date :day, :on_or_after => Time.now
  
  def self.search_doctor(doctor)
    joins(:doctor).where("doctors.name LIKE ?","%#{doctor}%")
  end
  
  def self.search_date(date)
    where("day = ?",date)
  end
  
  def self.search_doctor_and_date(doctor,date)
    joins(:doctor).where("doctors.name LIKE ? and day =?","%#{doctor}%",date)
  end  
  
end
