class InvoiceType < ActiveRecord::Base
  has_many :invoices
end
