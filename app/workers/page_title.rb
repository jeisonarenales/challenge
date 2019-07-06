class PageTitle
  @queue = :page_titles_queue
  def self.perform(shortened_url_id)
    shortened_url = ShortenedUrl.find(shortened_url_id)
    title = Nokogiri::HTML::Document.parse(HTTParty.get(shortened_url.url).body).title
    shortened_url.update_attribute(:title, title)
  end
end