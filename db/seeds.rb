# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# カテゴリー　画像　-------------------------------------------------------
Category.create(id:1, name: "動 物", genre_status: 0, category_status: 1)
Category.create(id:2, name: "自然・風景", genre_status: 0, category_status: 1)
Category.create(id:3, name: "食べ物", genre_status: 0, category_status: 1)

# カテゴリー　音・音楽　-------------------------------------------------------
Category.create(id:4, name: "キャラクター", genre_status: 1, category_status: 1)
Category.create(id:5, name: "水の生物", genre_status: 1, category_status: 1)
Category.create(id:6, name: "建築物", genre_status: 1, category_status: 1)

# カテゴリー　動画　-------------------------------------------------------
Category.create!(id:7, name: "ベビー", genre_status: 2, category_status: 1)
Category.create!(id:8, name: "星 空", genre_status: 2, category_status: 1)
Category.create!(id:9, name: "オブジェ", genre_status: 2, category_status: 1)
Category.create!(id:10, name: "その他", genre_status: 2, category_status: 1)


Admin.create(id:1, email: "admin@admin", password: 111111)