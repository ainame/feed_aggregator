class Feed < ActiveRecord::Base
  attr_accessible :body, :posted_at, :site_id, :title, :url
  acts_as_taggable
  belongs_to :site
  validates :url, :uniqueness => true

  scope :latest, order(:posted_at)
  scope :latest_tagged, order(:posted_at).tagged_with(TagRule.all_tag_names, :any => true)

  def formatted_posted_at
    self.posted_at.strftime("%Y/%m/%d %H:%M")
  end
end
