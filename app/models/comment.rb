class Comment < ApplicationRecord
    belongs_to :user_id
    belongs_to :commentable, polymorphic: true
end
