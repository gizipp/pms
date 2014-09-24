class Task < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user
  has_many :comments
  has_many :attachments, as: :attachable

  validate :not_past_date

  # Validate the the due date not in the past.
  def not_past_date
    if self.due_date < Date.today
      errors.add(:due_date, 'not in past')
    end
  end
end
