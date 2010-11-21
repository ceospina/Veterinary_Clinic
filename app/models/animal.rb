class Animal < ActiveRecord::Base
  #attr_accessible :name, :email
  #uniqueses
  
  attr_accessible :name, :birthDay, :sex, :description, :spayed, :diet, :breed_id, :client_id, :habitat
	belongs_to :breed, :foreign_key=>'breed_id'
	belongs_to :client
	has_many :consultas
	validates_associated :consultas, :breed
	#validates_associated :client
	has_many :doctors, :through => :consultas 
	validates_presence_of :description, :breed_id, :client_id, :name
	validates_format_of :name, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
	validates_length_of :name, :maximum=>30
	validates_length_of :description, :maximum=>500
  validates_length_of :habitat, :maximum=>30,:allow_nil=>true, :allow_blank=>true
    
	def self.for_select
	 all.collect{|c| [c.name, c.id]}
	end
	
	def self.search_client(document)
	 joins(:client).where('idDocument LIKE ?',"%#{document}%" )
	end
	
	def self.search_name(name)
	  where("name LIKE ?", "%#{name}%")
	end
	
	def self.search_name_and_client(name,document)
    joins(:client).where('animals.name LIKE ? and clients.idDocument LIKE ?', "%#{name}%", "%#{document}%" )
  end
 
	
end
