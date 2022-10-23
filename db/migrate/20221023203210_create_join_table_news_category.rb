class CreateJoinTableNewsCategory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :news, :categories do |t|
      # t.index [:news_id, :category_id]
      # t.index [:category_id, :news_id]
    end
  end
end
