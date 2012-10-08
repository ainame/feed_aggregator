# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sites = [
         {
           :name        => 'SocialGameInfo',
           :site_url    => 'http://gamebiz.jp',
           :feed_url    => 'http://gamebiz.jp/?feed=rss',
           :description => 'ソーシャルゲーム関連ニュース'
         },
         {
           :name        => 'ファミ通App',
           :site_url    => 'http://app.famitsu.com/',
           :feed_url    => 'http://app.famitsu.com/feed/',
           :description => 'ファミ通のスマートフォン向け情報'
         },
         {
           :name        => 'iNSIDE',
           :site_url    => 'http://www.inside-games.jp/',
           :feed_url    => 'http://www.inside-games.jp/rss/index.rdf',
           :description => 'ソーシャルゲーム以外も含むゲーム情報'
         },
         {
           :name        => '4Gamer.net(smartphone)',
           :site_url    => 'http://www.4gamer.net/smartphone',
           :feed_url    => 'http://www.4gamer.net/rss/smartphone/smartphone_index.xml',
           :description => '4Gamerのスマートフォン向け情報'
         },
         {
           :name        => 'ソーシャルゲームニュース',
           :site_url    => 'http://socialgamenews.info/',
           :feed_url    => 'http://feeds.socialgamenews.info/socialgamenews/gYpm',
           :description => 'ソーシャルゲーム情報を流す個人ブログっぽいサイト。ゲームのレビューが書いてあるので参考になるかも。'
         },
]

rules = [
         {:name => 'mixi', :rule => 'mixi'},
         {:name => 'mixi', :rule => 'ミクシィ'},
         {:name => 'GREE', :rule => 'GREE'},
         {:name => 'Mobage', :rule => 'モバゲー'},
         {:name => 'Mobage', :rule => 'DeNA'},
         {:name => 'Mobage', :rule => 'Mobage'},
         {:name => 'iPhone', :rule => 'iPhone'},
         {:name => 'iPhone', :rule => 'iOS'},
         {:name => 'iPhone', :rule => 'iPad'},
         {:name => 'Android', :rule => 'Android'},
         {:name => 'ランキング', :rule => 'ランキング'},
         {:name => 'ランキング', :rule => '位'},
         {:name => 'ランキング', :rule => '冠'},
         {:name => '事前登録', :rule => '事前登録'},
         {:name => 'リリース', :rule => '開始'},
         {:name => 'リリース', :rule => '配信'},
]


sites.each do |site|
  Site.create(site)  
end

rules.each do |rule|
  TagRule.create(rule)
end

Tasks::UpdateFeedsTask.new.insert_feed_and_update_tags
