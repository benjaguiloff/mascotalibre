class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :image
      t.string :species
      t.string :typo
      t.integer :price
      t.text :direction
      t.string :accepted, default: "false"

      t.timestamps
    end

  end
end
