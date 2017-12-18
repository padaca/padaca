class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    "#{self.email}"
  end

  def activate_account!   
    update_attribute :is_active, true 
  end
  
  def deactivate_account!   
    update_attribute :is_active, false 
  end

end
