class AddAbfahrtszeitpunktToFahrts < ActiveRecord::Migration
  def change
    add_column :fahrts, :abfahrt, :datetime
  end
end
