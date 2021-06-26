class CreateSolicitudes < ActiveRecord::Migration[5.2]
  def change
    create_table :solicitudes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :publication, index: true
      t.text :content
      t.integer :id_user
      t.integer :id_publication
      t.boolean :accepted

      t.timestamps
    end
  end
end
