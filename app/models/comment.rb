class Comment < ApplicationRecord
	belongs_to :user # 변경
	belongs_to :post
end
