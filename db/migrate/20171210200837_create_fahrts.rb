class CreateFahrts < ActiveRecord::Migration
  def change
    create_table :fahrts do |t|
      t.string :von
      t.string :nach
      t.integer :dauer
      t.integer :preisProMitfahrer
      t.integer :maxMitfahrer
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
