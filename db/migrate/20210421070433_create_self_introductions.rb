class CreateSelfIntroductions < ActiveRecord::Migration[6.0]
  def change
    create_table :self_introductions do |t|
      t.integer    :user_id,    null: false, foreign_key: true
      t.integer    :item_id,    null: false, foreign_key: true
      t.integer    :buyer_history_id,    null: false, foreign_key: true
      t.text       :text
      t.timestamps
    end
  end
end
