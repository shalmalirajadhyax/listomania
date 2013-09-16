# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  task_name     :string(255)
#  task_category :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :task_category, :task_name
  belongs_to :user
  
  validates :user_id, presence: true
  validates :task_name, presence: true, length: {maximum: 150}
  validates :task_category, presence: true
  validates_inclusion_of :task_category, in: %w(Home School Shopping)
  
  def self.search(search)
	if search
		where('task_name LIKE?', "%#{search}%")
	else
		scoped
	end
end
end
