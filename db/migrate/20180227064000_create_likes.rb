class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :post, comment: "좋아요 대상"
      t.belongs_to :user, uniques: true, comment: "좋아요를 누른 유저"
      t.timestamps
    end
  end
end
