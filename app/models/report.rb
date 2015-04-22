class Report < ActiveRecord::Base
  has_many :comments
  has_one :project, through: :release

  belongs_to :release
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  scope :accepted, -> { where(accepted_by_project_owner: true) }

  validates_presence_of :content, :author, :release

  def accepted?
    accepted_by_project_owner?
  end

end
