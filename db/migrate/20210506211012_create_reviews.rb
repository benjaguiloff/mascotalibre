class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :id_user
      t.integer :id_reviewed
      t.integer :rating

      t.timestamps
    end
  end
end
