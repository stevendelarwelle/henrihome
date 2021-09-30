class CreateSwansonQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :swanson_quotes do |t|
      t.string :quote

      t.timestamps
    end
  end
end
