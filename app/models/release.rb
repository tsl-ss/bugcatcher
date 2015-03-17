class Release < ActiveRecord::Base
  belongs_to :project
  has_many :screenshots, as: :screenshotable, dependent: :destroy
  has_many :reports

  validates :title, presence: true
  validates :description, presence: true

  before_create :close_any_open_project_releases

  accepts_nested_attributes_for :screenshots, allow_destroy: true

  scope :open, -> { where(open: true) }
  scope :closed, -> { where(open: false) }

  def close_release
    self.open = false
  end

  def close_release!
    self.close_release
    self.save
  end

  private

    def close_any_open_project_releases
      self.project.releases.open.each do |project_release|
        project_release.close_release!
      end
    end
end
