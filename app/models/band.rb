require 'open-uri'

class Band
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  key :name
  
  embeds_many :albums
  
  def self.generate
    Band.create name: Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Special:Random'))
      .css('.firstHeading').first().content()
  end
  
  def generate_album
    cover_url = Nokogiri::HTML(open('http://www.flickr.com/explore/'))
      .css('.photo_container img:first').first().attribute('src').value()
    
    name = Nokogiri::HTML(open('http://quotationspage.com/random.php3'))
      .css('.quote a').last().content().split()[-4..-1].join(' ').capitalize()
    
    self.albums.create name: name, cover_url: cover_url
  end
end