class AddIstGespeichertToFahrt < ActiveRecord::Migration
  def change
    add_column :fahrts, :istGespeichert, :boolean
  end
end
