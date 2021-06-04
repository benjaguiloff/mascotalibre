class CreateFakes < ActiveRecord::Migration[5.2]
  def change
    create_table :fakes do |t|
      t.string :accepted
      t.timestamps
    end
  end
end
