class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :email_emisor
      t.string :email_receptor
      t.text :body

      t.timestamps
    end
  end
end
