class CreateForums < ActiveRecord::Migration[7.0]
  def change
    create_table :forums do |t|
      t.string :title
      t.string :body
      t.string :status, default: :passive, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
