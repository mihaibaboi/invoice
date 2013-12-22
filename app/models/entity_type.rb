class EntityType < ActiveRecord::Base
  has_many :entities
  validates_presence_of :name
end