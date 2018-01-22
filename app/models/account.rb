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

  def fahrerbewertung_aktualisieren(neue_bewertung)
    puts "-----------------------------------------------------------------------"
    puts neue_bewertung
    alte_anzahl_str = ActiveRecord::Base.connection.execute("select count(*) as anzahl from mitfahrers m inner join fahrts f on m.fahrt_id = f.id where m.fahrerbewertung is not null and f.account_id = " + self.id.to_s)
    puts alte_anzahl_str
    alte_anzahl = alte_anzahl_str[0]['anzahl'].to_f
    puts self.fahrerbewertung
    if self.fahrerbewertung
      alte_bewertung = self.fahrerbewertung
    else
      alte_bewertung = 0
    end
    neuer_wert = (alte_anzahl.to_f * alte_bewertung + neue_bewertung.to_f)/(alte_anzahl.to_f + 1)
    puts neuer_wert
    update_attribute :fahrerbewertung, neuer_wert
  end

  def mitfahrerbewertung_aktualisieren(neue_bewertung)
    puts "-----------------------------------------------------------------------"
    puts neue_bewertung
    alte_anzahl_str = ActiveRecord::Base.connection.execute("select count(*) as anzahl from mitfahrers m where m.mitfahrerbewertung is not null and account_id =  " + self.id.to_s)
    puts alte_anzahl_str
    alte_anzahl = alte_anzahl_str[0]['anzahl'].to_f
    puts self.fahrerbewertung
    if self.fahrerbewertung
      alte_bewertung = self.fahrerbewertung
    else
      alte_bewertung = 0
    end
    neuer_wert = (alte_anzahl.to_f * alte_bewertung + neue_bewertung.to_f)/(alte_anzahl.to_f + 1)
    puts neuer_wert
    update_attribute :mitfahrerbewertung, neuer_wert
  end
end
