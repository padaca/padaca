class AddReadAttributesToNachricht < ActiveRecord::Migration
  def change
    add_column :nachrichts, :seen, :datetime
    add_column :nachrichts, :read, :datetime
  end
end
