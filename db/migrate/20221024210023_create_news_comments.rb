class CreateNewsComments < ActiveRecord::Migration[7.0]
  def change
    create_table :news_comments do |t|
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :news, null: false, foreign_key: true

      t.timestamps
    end
  end
end
