require 'open-uri'

class Band
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  key :name
  
  def self.generate
    Band.create name: Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Special:Random'))
        .css('.firstHeading').first().content()
  end
end