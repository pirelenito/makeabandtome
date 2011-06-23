class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :cover_url
  
  key :name
  
  embedded_in :band
  
  def generate_fields
    generate_name
    generate_cover
  end
  
  def generate_name
    self.name = Nokogiri::HTML(open('http://quotationspage.com/random.php3'))
      .css('.quote a').last().content().split()[-4..-1].join(' ').capitalize()
  end
  
  def generate_cover
    self.cover_url = Nokogiri::HTML(open('http://www.flickr.com/explore/'))
      .css('.photo_container img:first').first().attribute('src').value()
  end
end