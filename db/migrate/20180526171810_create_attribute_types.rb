class CreateAttributeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
