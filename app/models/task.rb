class Task < ActiveRecord::Base
  attr_accessible :task_category, :task_name
  belongs_to :user
  
  validates :user_id, presence: true
  validates :task_name, presence: true, length: {maximum: 150}
  validates :task_category, presence: true
  validates_inclusion_of :task_category, in: %w(Home School Shopping)
  
end
