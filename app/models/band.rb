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
    self.albums.create name: Nokogiri::HTML(open('http://quotationspage.com/random.php3'))
      .css('.quote a').last().content().split()[-4..-1].join(' ').capitalize()
  end
end