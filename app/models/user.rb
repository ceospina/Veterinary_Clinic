class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
 attr_accessible :email, :password, :password_confirmation, :first_name, :last_name
 validates_uniqueness_of :email
 has_and_belongs_to_many :roles, :uniq =>true
 validates_uniqueness_of :email
 validates_presence_of :first_name,:last_name,:email#, :current_password ,:password,:password_confirmation
 validates_length_of :first_name,:last_name, :maximum=>30
 validates_format_of :first_name,:last_name, :with => /\A[a-zA-Z]+([\s]+[a-zA-Z]+)?\Z/i
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
end
