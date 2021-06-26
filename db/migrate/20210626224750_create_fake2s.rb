class CreateFake2s < ActiveRecord::Migration[5.2]
  def change
    create_table :fake2s do |t|
      t.string :typo

      t.timestamps
    end
  end
end
