class TagRule < ActiveRecord::Base
  attr_accessible :name, :rule

  def self.all_tag_names
    self.all.map{|t| t.name }
  end
end
