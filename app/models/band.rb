require 'open-uri'

class Band
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  key :name
  
  embeds_many :albums
  
  def self.generate
    Band.create do |band|
      band.generate_fields
    end
  end
  
  def generate_fields
    generate_name
    generate_first_album
  end
  
  def generate_name
    self.name = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Special:Random'))
      .css('.firstHeading').first().content()
  end
  
  def generate_first_album
    self.albums.new do |album|
      album.generate_fields
    end
  end
end