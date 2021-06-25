# BULK_UNIT = 10_000
# AMOUNT_OF_USERS = 1_000_000
# AMOUNT_OF_BOOKS = 3_000_000

# BULK_UNIT = 1_000
# AMOUNT_OF_USERS = 1_000
# AMOUNT_OF_BOOKS = 1_000
#
# USER_ITERATION = AMOUNT_OF_USERS / BULK_UNIT # 10
# BOOKS_ITERATION = AMOUNT_OF_BOOKS / BULK_UNIT # 30
#

# (1..USER_ITERATION).each do |n|
#   users = []
#   BULK_UNIT.times do
#     time = Time.current
#     users <<
#       {
#         last_name: Faker::Name.last_name,
#         first_name: Faker::Name.first_name,
#         age: rand(18..100),
#         created_at: time,
#         updated_at: time
#       }
#   end
#   User.insert_all users
#   p "inserted #{ BULK_UNIT * n } users"
# end
#
# (1..BOOKS_ITERATION).each do |n|
#    books = []
#    BULK_UNIT.times do
#     time = Time.current
#     books <<
#       {
#         title: Faker::Book.title,
#         price: rand(50..100) * 10,
#         user_id: "#{ rand(1..AMOUNT_OF_USERS) }",
#         created_at: time,
#         updated_at: time
#       }
#   end
#   Book.insert_all books
#    p "inserted #{ BULK_UNIT * n } books"
# end
# Faker::Config.locale = :ja

# 5.times { User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, age: rand(18..30)) }

