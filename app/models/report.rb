class Report < ActiveRecord::Base
  belongs_to :release
  has_many :comments
end
