class AddDailyPriceToGarage < ActiveRecord::Migration[5.0]
  def change
    add_column :garages, :daily_price, :integer
  end
end
