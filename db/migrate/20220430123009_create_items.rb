class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
  ## 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end

end
