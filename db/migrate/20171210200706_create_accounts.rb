class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :vorname
      t.string :nachname
      t.string :geschlecht
      t.boolean :istMitarbeiter, default: false
      t.integer :fahrerbewertung
      t.integer :mitfahrerbewertung
      t.string :standort

      t.timestamps null: false
    end
  end
end
