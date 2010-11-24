require 'date'
class Horary < ActiveRecord::Base
	belongs_to :doctor
	has_many :meetings, :dependent => :destroy
	attr_accessible :day,:startTime, :finalHour, :doctor_id
	validates_presence_of :startTime,:finalHour,:doctor_id
  validates_time :startTime, :on_or_after => '6:00am', :before => '5:00pm',:format=>'h:nn_ampm'
  validates_time :finalHour, :after => :startTime, :before => '5:20pm',:format=>'h:nn_ampm'
  validates_date :startTime, :on_or_after => Time.now
  validate :before_create_exist?, :on=>'create'
  validate :before_update_exist?, :on=>'create'
  
  
  def before_create_exist?
   hry=Horary.where('doctor_id=? and day=?',doctor_id, day )
   validates_horary(hry)
  end
  def before_update_exist?
    hry=Horary.where('doctor_id=? and day=? and id<>?',doctor_id, day, id )
    validates_horary(hry)
  end
  def validates_horary(hry)
  
    hry.each do |h|
   
      if (startTime>=h.startTime && startTime<h.finalHour) 
        errors.add(:startTime,"The Horary exists")
      elsif (finalHour>=h.startTime && finalHour<=h.finalHour)
        errors.add(:finalHour,"The Horary exists")
      elsif (startTime<=h.startTime and finalHour>=h.finalHour)
        errors.add(:finalHour,"The Horary exists")
        errors.add(:startTime,"The Horary exists")
      end
    end
  end
  def self.update_meetings(horary)
    Meeting.find_by_sql(["DELETE FROM meetings WHERE horary_id=?", horary.id])
    return Horary.create_meetings(horary)
  end
  
 def self.create_meetings(horary)
   hora=horary.startTime    
     while hora<horary.finalHour do
        c=Meeting.new(:meetingDate=>horary.day,:meetingHour=>hora,:horary_id=>horary.id, :ownerId=>0)
        c.save
        hora=hora.advance(:minutes=>20)
      end
      return true
 end
   
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
