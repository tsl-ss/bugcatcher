class Release < ActiveRecord::Base
  belongs_to :project
  has_many :reports
  has_many :screenshots, as: :screenshotable, dependent: :destroy
  accepts_nested_attributes_for :screenshots, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true

  before_create :close_any_open_project_releases

  scope :open, -> { where(open: true) }
  scope :closed, -> { where(open: false) }

private

  def close_any_open_project_releases
    self.project.releases.open.each do |project_release|
      project_release.update_attribute(:open, false)
    end
  end

end
