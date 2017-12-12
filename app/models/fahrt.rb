class Fahrt < ActiveRecord::Base
  belongs_to :account

  def to_s
    "#%04d: %s nach %s" % [self.id, self.von, self.nach]
  end

end
