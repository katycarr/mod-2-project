class CreatePropertyManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :property_managers do |t|
      t.string :name

      t.timestamps
    end
  end
end
