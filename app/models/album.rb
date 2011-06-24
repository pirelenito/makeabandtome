class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :cover_url
  field :cover_source
  field :cover_photo_by
  
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
    doc = Nokogiri::HTML(open('http://www.flickr.com/explore/'))
    
    self.cover_url = doc.css('.photo_container img:first').first().attribute('src').value()
    self.cover_source = 'http://www.flickr.com' + doc.css('.PhotoBy a:first').first().attribute('href').value()
    self.cover_photo_by = doc.css('.PhotoBy a:last b').first().content()
  end
end