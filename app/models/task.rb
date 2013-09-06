class Task < ActiveRecord::Base
  attr_accessible :category, :content, :status, :user_id
  validates :content, :length => {maximum: 150}
  belongs_to :user
end
