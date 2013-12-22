class InvoiceEntity < ActiveRecord::Base
  belongs_to :entity
  belongs_to :invoice
  belongs_to :invoice_entity_type
end
