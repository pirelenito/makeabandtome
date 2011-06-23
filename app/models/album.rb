class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :cover_url
  
  key :name
  
  embedded_in :band
end