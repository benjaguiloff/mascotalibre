class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :contents
      t.integer :user_id
      t.belongs_to :publication

      t.timestamps
    end
  end
end
