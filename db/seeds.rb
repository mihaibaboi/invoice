# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EntityType.create(code: 'IND', name: 'individual')
EntityType.create(code: 'CMP', name: 'company')

InvoiceType.create(code: 'PRF', name: 'pro forma')
InvoiceType.create(code: 'FNL', name: 'final')

InvoiceEntityType.create(code: 'SPL', name: 'supplier')
InvoiceEntityType.create(code: 'CLN', name: 'client')

UserType.create(code: 'ADM', name: 'admin')
UserType.create(code: 'USR', name: 'user')
UserType.create(code: 'GST', name: 'guest')

User.create(user_type_id: '1', username: 'admin', email: 'admin@mihaibaboi.com', hashed_password: '', first_name: 'System', last_name: 'Admin')
User.create(user_type_id: '2', username: 'mihaibaboi', email: 'mihai@mihaibaboi.com', hashed_password: '', first_name: 'Mihai', last_name: 'Baboi')
User.create(user_type_id: '3', username: 'guest', email: 'guest@mihaibaboi.com', hashed_password: '', first_name: 'System', last_name: 'Guest')