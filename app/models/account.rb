class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # to String
  def to_s
    "#{self.email}"
  end

  # activates an account
  def activate_account!   
    update_attribute :is_active, true 
  end
  
  # deactivates an account
  def deactivate_account!   
    update_attribute :is_active, false 
  end

  # returns whether the account ist active
  def active_for_authentication?
    super and self.is_active?
  end

  # returns a message when account is deactive
  def inactive_message
    "You are not allowed to log in."
  end

end
