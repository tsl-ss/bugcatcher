class Project < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :releases, dependent: :destroy
  has_many :reports, through: :releases

  has_many :screenshots, as: :screenshotable, dependent: :destroy
  accepts_nested_attributes_for :screenshots, allow_destroy: true

  has_attached_file :logo,
    styles: { medium: "300x300#", thumb: "100x100#" },
    default_url: "default_logo.png"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :owner, presence: true

  def owner_email
    owner.email if owner.present?
  end

end
