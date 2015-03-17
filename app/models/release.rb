class Release < ActiveRecord::Base
  belongs_to :project
  has_many :screenshots, as: :screenshotable

  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :screenshots, allow_destroy: true

  scope :open, -> { where(open: true) }
  scope :closed, -> { where(open: false) }

  def close_release
    self.open = false
  end
end
