class CreateNachrichts < ActiveRecord::Migration
  def change
    create_table :nachrichts do |t|
      t.references :sender, index: true, foreign_key: {to_table: :account}
      t.references :empfaenger, index: true, foreign_key: {to_table: :account}
      t.string :nachricht

      t.timestamps null: false
    end
  end
end
