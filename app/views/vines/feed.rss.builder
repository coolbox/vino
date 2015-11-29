#encoding: UTF-8

xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Grapevino"
    xml.author "Grapevino"
    xml.description "Entertainment channel"
    xml.link "https://tranquil-tundra-5172.herokuapp.com"
    xml.language "en"

    for video in @vines
      xml.item do
        xml.title feed_title(video)
        xml.author video.username
        xml.pubDate video.created
        xml.link video.permalinkUrl
        xml.guid video.permalinkUrl.split("/").last
        xml.description "#{video.description} - #{video.username}"
      end
    end
  end
end
