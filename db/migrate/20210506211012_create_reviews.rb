class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :id_user
      t.integer :id_reviewed

      t.timestamps
    end
  end
end
