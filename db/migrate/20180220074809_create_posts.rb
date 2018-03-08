class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.string :email, comment: "추가"
      t.text :content

      t.integer :like_count, comment: "좋아요 개수"

      t.timestamps
    end
  end
end
