class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :report

  validates_presence_of :user, :report, :text

  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
