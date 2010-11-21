class Doctor < ActiveRecord::Base
	has_many :consultas
	has_many :horaries
	has_many :meetings
	#validates_associated :meetings,:horaries
	validates_uniqueness_of :email, :idDocument
	attr_accessible :name, :lastName, :idDocument, :speciality, :address, :email, :phoneHome, :phoneCell
	has_many :animals, :through => :consultas
	validates_presence_of :name,:lastName,:idDocument,:speciality,:address
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :name,:lastName,:speciality, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  validates_length_of :name, :lastName, :maximum=>30
  #validates_length_of :password, :minimum => 7, :maximum => 10
  validates_numericality_of :idDocument
  validates_numericality_of :phoneHome, :phoneCell, :allow_nil=>true
  validates_uniqueness_of :email, :userName, :idDocument
  #validates_format_of :userName, :with => /\A[a-z\d_]{6,20}\Z/i
  #validates_length_of :idDocument, :minimum => 7, :maximum => 10
  #validates_length_of :phoneCell, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :phoneHome, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :userName, :in => 6..20
 
	def self.for_select
	   all.collect{|c| [c.name, c.id]}
  end
  
  def self.for_name(name)
    where("name LIKE ?","%#{name}%")
  end
  
  def self.for_cedula(cedula)
    where("idDocument LIKE ?","%#{cedula}%")
  end
  
  def self.for_name_and_cedula(name,cedula)
    where("name LIKE ? and idDocument LIKE ?","%#{name}%","%#{cedula}%")
  end
end
