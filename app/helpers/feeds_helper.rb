module FeedsHelper
  def tag_cloud(tags, options = {})
    word_list = (tags|| []).map do |tag|
       {
         text: tag.name,
         weight: tag.count
       }
    end
    js_src =<<JS
var word_list = #{word_list.to_json};
$(function(){
  $("#wordcloud").jQCloud(word_list);
});
JS
  end
end
