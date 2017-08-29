class Comment < ActiveRecord::Base
	validates :body, presence: true

	belongs_to :commentable,  polymorphic: true
	has_many :comments, as: :commentable
	belongs_to :user
end
