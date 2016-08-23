class CreateGarages < ActiveRecord::Migration[5.0]
  def change
    create_table :garages do |t|
      t.string :location
      t.integer :daily_price_cents

      t.timestamps
    end
  end
end
