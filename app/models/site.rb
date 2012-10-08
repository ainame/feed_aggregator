class Site < ActiveRecord::Base
  attr_accessible :description, :feed_url, :name, :site_url
  has_one :feed
end
