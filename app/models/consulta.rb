class Consulta < ActiveRecord::Base
	belongs_to :animal
	belongs_to :doctor
	belongs_to :typeConsult
	attr_accessible :date, :medicalAlert, :allergies, :vaccines, :medicalTests, :surgeries, :weight,:diagnosis,:temperature,:dateAdmission
  attr_accessible :dischargeDate, :dateDeath,:typeConsult_id,:animal_id,:doctor_id,:heartRate,  :pulse, :injuries, :treatment
	validates_presence_of :date,:medicalAlert,:weight,:diagnosis,:temperature,:heartRate,:pulse,:treatment,:typeConsult_id,:animal_id,:doctor_id
	#validates_associated :doctor,:typeConsult
	validates_length_of :medicalAlert, :diagnosis,:treatment, :maximum=>500
	validates_length_of :allergies, :vaccines, :medicalTests, :surgeries, :injuries,:maximum=>500, :allow_nil=>true, :allow_blank=>true
	validates_numericality_of :weight, :temperature, :heartRate,:pulse
  
  def self.search_animal(name)
    joins(:animal).where('name like ?',"%#{name}%")
  end
  
  def self.search_date(date)
    where('date = ?', date)
  end
  
  def self.search_animal_and_date(name,date)
   # a = Animal.search_name(name)
    joins(:animal).where("name like ? and date=?", "%#{name}%", date )
   #c = where('animal_id = ? and date = ?',a.first.id,date) unless a.empty?
   #c||=[]
  end
  
  def self.search(name, date)
    r=joins(:animal).where('name like ?',"%#{name}%") unless name.empty? or date.present?   
    r=where('date = ?', date) unless date.empty? or name.present?
    r=joins(:animal).where("name like ? and date=?", "%#{name}%", date) unless name.empty? or date.empty?
    return r||=[]
  end
    
end
