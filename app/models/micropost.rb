class Micropost < ActiveRecord::Base
  belongs_to :user
  vaidates :user_id, presence: true
  vaidates :content, presence: true, length: {maximum: 140}
end
