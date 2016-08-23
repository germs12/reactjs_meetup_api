class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.references :garage, foreign_key: true
      t.references :owner, foreign_key: true
      t.string :kind
      t.string :maker

      t.timestamps
    end
  end
end
