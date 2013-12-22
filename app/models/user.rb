class User < ActiveRecord::Base
  belongs_to :user_type
  has_many :invoices
end
