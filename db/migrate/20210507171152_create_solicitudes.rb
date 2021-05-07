class CreateSolicitudes < ActiveRecord::Migration[5.2]
  def change
    create_table :solicitudes do |t|
      t.text :content
      t.integer :id_user
      t.integer :id_publication
      t.boolean :accepted

      t.timestamps
    end
  end
end
