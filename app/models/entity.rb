class Entity < ActiveRecord::Base
  belongs_to :entity_type
  has_many :invoice_entities
end
