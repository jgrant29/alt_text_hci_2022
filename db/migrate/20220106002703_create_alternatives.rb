class CreateAlternatives < ActiveRecord::Migration[7.0]
  def change
    create_table :alternatives do |t|
      t.string :title
      t.text :orginal_url
      t.text :original_source
      t.boolean :verified
      t.belongs_to :user, null: false, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
