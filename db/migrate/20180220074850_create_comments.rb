class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, comment: "추가"
      t.belongs_to :post
      t.string :content
      t.timestamps
    end
  end
end
