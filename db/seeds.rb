# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "0@0", password: "password")
User.create!(username: "test", email: "x@x", password: "password", sex: 0, birth_date: "1987-09-01")

HotSpring.create!(name: "別府海浜砂湯", introduction: "海沿いにある砂湯です。1度に10名以上が入浴できグループの方もいっしょに楽しむことができます。可動式屋根があるので雨天時でも入浴できます。休憩所あり。源泉かけ流しです。", address: "〒874-0023　別府市上人", price: "1500円", private_bath_price: "-", hours: "【3月～11月】8時30分～18時（最終受付17時）【12月～2月】9時～17時（最終受付16時）", holiday: "毎月第4水曜日（祝日の場合は翌日）", parking: "10台", contact: "電話：0977-66-5737",running_status: 0, is_pablished: 1)
HotSpring.create!(name: "柴石温泉", introduction: "療養効果の高い温 泉地として国民保養温泉地、国民保健温泉地として指定されています。温度の違う2つの温泉や露天風呂・ 蒸し湯があり、家天風呂・ 蒸し湯があり、家族湯も利用可能。源泉掛け流しです。", address: "〒874-0016　別府市野田4組", price: "大人300円、小人100円", private_bath_price: "2000円（1時間4人まで）", hours: "【普通浴】7：00～20：00 【家族湯】9：00～20：00 （最終受付19：00）※14：00～15：00までの1時間は清掃時間のため、入館・入浴はできません", holiday: "毎月第2水曜日（祝日の場合は翌日）", parking: "35台", contact: "電話：0977-67-4100",running_status: 0, is_pablished: 1)
HotSpring.create!(name: "芝居の湯", introduction: "天井部分を高くして、1・2階吹き抜けの空間を確保し、ゆったりとした浴槽の中から外の美しい庭園を楽しむことができます。うたせ湯も併設しています。", address: "〒874-0905　別府市上野口町29番13号", price: "大人（中学生以上）300円、小人100円", private_bath_price: "-", hours: "11時～21時（最終受付20時30分）", holiday: "火曜", parking: "30台", contact: "電話：0977-24-5320", running_status: 0,is_pablished: 1 )
HotSpring.create!(name: "堀田温泉", introduction: "内湯、露天風呂の楽しめる、市営温泉です。 休憩室もあり、くつろげます。 引湯かけ流し。", price: "大人300円、小人100円", private_bath_price: "-", hours: "6：30～22：30 ※14：00～15：00までの1時間は清掃時間のため、入館・入浴はできません。", holiday: "第1水曜日（祝日の場合は翌日）", address: "〒874-0831　別府市堀田2組", parking: "約30台", contact: "電話：0977-24-9418", running_status: 0, is_pablished: 1)

Review.create!(title: "コスパ最高！", body: "地元の方が多いですが回転が速いので気になりません。この値段でシャワーがあり、露天風呂もあるので最高です！", rate: 5.0, hot_spring_id: 4, user_id: 1, is_pablished: true )
Review.create!(title: "仕事帰りに！", body: "毎日仕事帰りに寄っています。熱湯とぬる湯があり、子供連れでも安心です。堀田温泉と同じお湯を引いているようですが、温泉を濾しているので浮遊物は少ないです。管理の方が温度を頻繁にチェックされているので快適に入浴できます。", rate: 4.5, hot_spring_id: 3, user_id: 1, is_pablished: true)
