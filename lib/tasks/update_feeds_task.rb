require 'open-uri'
require 'feed-normalizer'

class Tasks::UpdateFeedsTask
  def insert_feed_and_update_tags
    sites = Site.all
    sites.each do |site|
      feeds = fetch_feed(site)
      insert_each_feeds(feeds)
    end
  end

  def update_all_feeds_tags
    feeds = Feed.all
    feeds.each do |feed|
      set_tags(feed)
    end
  end

  private
  def fetch_feed(site)
    raw_feed = FeedNormalizer::FeedNormalizer.parse open(site.feed_url)
    raw_feed.items.map do |feed|
      {
        :site_id => site.id,
        :title => feed.title || '',
        :body  => feed.content || raw_feed.description || '',
        :url   => feed.urls.first || '',
        :posted_at => raw_feed.last_updated.to_datetime || DateTime.now
      }
    end
  end

  def insert_each_feeds(feeds)
    feeds.each do |feed|
      insert_feed(feed)
    end
  end

  def insert_feed(feed_data)
    feed = Feed.new(feed_data)
    if feed.save
      puts "succeeded to insert #{feed.title}."
      set_tags(feed)
    else

    end
  end

  def set_tags(feed)
    feed.tag_list = get_matched_tags(feed)
    puts "suc: #{feed.title} - #{feed.tag_list}" unless feed.tag_list.empty?
    feed.save
  end

  def get_matched_tags(feed)
    matched_tags = tag_rules.select do |tag_rule|      
      feed.title.match(tag_rule.rule)
    end.map do |tag_rule|
      tag_rule.name
    end

    matched_tags.join(' ')
  end

  def tag_rules
    @tag_rules ||= TagRule.all
  end

end
