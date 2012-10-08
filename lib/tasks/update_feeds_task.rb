require 'open-uri'
require 'feed-normalizer'
require 'nkf'

class Tasks::UpdateFeedsTask
  def insert_feed_and_update_tags
    sites = Site.all
    sites.each do |site|
      feeds = fetch_feed(site)
      insert_each_feeds(feeds)
    end

    # buffered_logger needs flush
    Rails.logger.flush
  end

  def update_all_feeds_tags
    feeds = Feed.all
    feeds.each do |feed|
      set_tags(feed)
    end
  end

  private
  def fetch_feed(site)
    raw_feeds = FeedNormalizer::FeedNormalizer.parse open(site.feed_url)
    raw_feeds.items.map do |feed|
      if feed.url.to_s.empty? || feed.title.to_s.empty? 
        nil
      else
        {
          :site_id => site.id,
          :title => NKF.nkf('-w',feed.title) || '',
          :body  => NKF.nkf('-w',feed.content)||  NKF.nkf('-w', raw_feeds.description) || '',
          :url   => feed.url.to_s.empty? ? '' : feed.urls.first,
          :posted_at => feed.last_updated.to_s.empty? ? (feed.date_published.to_s.empty? ? DateTime.now : feed.date_published) : feeds.last_updated.to_datetime
        }
      end
    end.compact
  end

  def insert_each_feeds(feeds)
    feeds.each do |feed|
      insert_feed(feed)
    end
  end

  def insert_feed(feed_data)
    feed = Feed.new(feed_data)
    if feed.save
      Rails.logger.info "succeeded to insert: #{feed.title}."
      set_tags(feed)
    else
      Rails.logger.info "already inserted feed. not updating tags: #{feed.title}."
    end
  end

  def set_tags(feed)
    feed.tag_list = get_matched_tags(feed)
    Rails.logger.info "update tag: #{feed.title} - #{feed.tag_list}"
    feed.save
  end

  def get_matched_tags(feed)
    tag_rules.select do |tag_rule|      
      feed.title.match(tag_rule.rule)
    end.map do |tag_rule|
      tag_rule.name
    end.uniq.join(',')
  end

  def tag_rules
    @tag_rules ||= TagRule.all
  end

end
