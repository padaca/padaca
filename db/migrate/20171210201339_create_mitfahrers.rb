class CreateMitfahrers < ActiveRecord::Migration
  def change
    create_table :mitfahrers do |t|
      t.references :fahrt, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true
      t.integer :mitfahrerbewertung
      t.integer :fahrerbewertung
      t.boolean :istBestatigt

      t.timestamps null: false
    end
  end
end
