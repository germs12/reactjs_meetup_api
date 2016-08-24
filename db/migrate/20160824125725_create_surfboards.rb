class CreateSurfboards < ActiveRecord::Migration[5.0]
  def change
    create_table :surfboards do |t|
      t.string :size
      t.string :color
      t.integer :length_in_cm

      t.timestamps
    end
  end
end
