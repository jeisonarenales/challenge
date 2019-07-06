class ShortenedUrl < ApplicationRecord
  validates :url, url: true

  # handle json response
  def as_json(options={})
    super(:only => [:url,:title, :unique_key])
  end
end
