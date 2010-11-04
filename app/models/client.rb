class Client < ActiveRecord::Base
	has_many :animals, :dependent => :destroy 
	validates_presence_of :name,:lastName,:idDocument,:address
	#:email_confirmation
 # validates_confirmation_of :email, :message=>"Los correos no coinciden"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :name,:lastName, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  validates_length_of :name, :lastName, :maximum=>30
  validates_length_of :password, :minimum => 7, :maximum => 10
  validates_numericality_of :idDocument
  validates_numericality_of :phoneHome, :phoneCell, :phoneWork, :allow_nil=>true
  validates_uniqueness_of :email, :userName, :idDocument
  validates_format_of :userName, :with => /\A[a-z\d_]{6,20}\Z/i
  #validates_length_of :idDocument, :minimum => 7, :maximum => 10
  #validates_length_of :phoneCell, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :phoneWork, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :phoneHome, :within => 7..10,:allow_nil=>true, :allow_blank=>true
  #validates_length_of :userName, :in => 6..20
 
  def self.for_select
    all.collect {|c| [c.name, c.id]}
  end
   
     
    
end
