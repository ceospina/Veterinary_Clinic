class Client < ActiveRecord::Base
	has_many :animals, :dependent => :destroy 
	validates_presence_of :name,:lastName,:idDocument,:address
	attr_accessible :name, :lastName, :idDocument,:email,:phoneHome,:phoneCell,:phoneWork,:address,:isowner
	#:email_confirmation
 # validates_confirmation_of :email, :message=>"Los correos no coinciden"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :name,:lastName, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  validates_length_of :name, :lastName, :maximum=>30
  validates_length_of :password, :minimum => 7, :maximum => 10,:allow_blank=>true, :allow_nil=>true
  validates_numericality_of :idDocument
  validates_numericality_of :phoneHome, :phoneCell, :phoneWork, :allow_nil=>true
  validates_uniqueness_of :email, :userName, :idDocument
  validates_format_of :userName, :with => /\A[a-z\d_]{6,20}\Z/i, :allow_blank=>true, :allow_nil=>true
  #validates_length_of :idDocument, :minimum => 7, :maximum => 10
  #validates_length_of :phoneCell, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :phoneWork, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :phoneHome, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :userName, :in => 6..20
  #validates :idDocument, :length => { :minimum => 7, :maximum => 10 }
  validates :idDocument,  :inclusion => { :in => 1000000..9999999999 }

  validates_uniqueness_of :idDocument
  validates_uniqueness_of :email
 
  def self.for_select
    all.collect {|c| [c.name, c.id]}
  end
  
  def self.for_cedula(cedula)
    where("idDocument LIKE ?", "%#{cedula}%")
  end

  def self.for_name(name)
    where("name LIKE ?", "%#{name}%")
  end
  
  def self.for_name_and_cedula(name,cedula)
    where("name like ? and idDocument like ?", "%#{name}%", "%#{cedula}%" )
  end

end
