class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :avatar, :attachment_presence => true
  has_attached_file :avatar,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :projects, dependent: :destroy
  has_many :comments
  has_many :reports, :class_name => "Report", :foreign_key => "author_id"

  def self.leaderboard(interval)
    leaderboard = []

    User.all.each_with_index do |user, index|
      result = {}
      result[:user] = user
      result[:count] = user.accepted_reports(interval)
      leaderboard << result
    end

    leaderboard.sort_by! { |lb| -1*lb[:count] }
  end

  def accepted_reports(interval)
    if interval == :alltime
      self.reports.accepted.count
    elsif interval == :monthly
      self.reports.accepted.where("created_at > ?", (Time.now - 30.days)).count
    else
      0
    end
  end

  def rank(interval)
    leaderboard = User.leaderboard(interval)

    leaderboard.find_index { |lb| lb[:user] == self } + 1
  end
end
