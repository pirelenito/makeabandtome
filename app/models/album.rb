class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  
  embedded_in :band
end