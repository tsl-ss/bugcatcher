class Report < ActiveRecord::Base
  belongs_to :release
  has_many :comments
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"

  scope :accepted, -> { where(accepted_by_project_owner: true) }
end
