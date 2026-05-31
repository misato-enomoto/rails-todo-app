class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  before_save :set_completed_at

  scope :ordered_for_index, -> {
    order(
      completed: :asc,
      due_date: :asc,
      created_at: :desc
    )
  }

  private

  def set_completed_at
    if completed?
      self.completed_at ||= Time.current
    else
      self.completed_at = nil
    end
  end
end
