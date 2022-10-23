class CreateJoinTableForumCategory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :forums, :categories do |t|
      # t.index [:forum_id, :category_id]
      # t.index [:category_id, :forum_id]
    end
  end
end
