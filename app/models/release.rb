class Release < ActiveRecord::Base
  belongs_to :project
  has_many :screenshots, as: :screenshotable

  validates :title, presence: true
  validates :description, presence: true
  validates :open, presence: true
end
