class CreateQuoteRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_ratings do |t|
      t.references :swanson_quote
      t.integer :rating
      t.string :ip_address

      t.timestamps
    end
  end
end
