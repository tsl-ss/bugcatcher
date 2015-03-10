class Project < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :screenshots

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true, uniqueness: { scope: :user }
  validates :description, presence: true

  accepts_nested_attributes_for :screenshots, allow_destroy: true

end
