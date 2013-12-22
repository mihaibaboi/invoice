class Invoice < ActiveRecord::Base
  belongs_to :invoice_type
  has_many :invoice_items
  has_many :receipts
  has_many :invoice_entities
  belongs_to :user
end
