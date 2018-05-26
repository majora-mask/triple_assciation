class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :setting_value
      t.references :attribute_type, foreign_key: true
      t.references :actor, foreign_key: true
      t.timestamps
    end
  end
end
