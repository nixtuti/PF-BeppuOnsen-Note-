# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "0@0", password: "password")
User.create!(username: "testuser", email: "x@x", password: "password", sex: 0, birth_date: "1987-09-01")

Quality.create!([
    { name: '単純温泉' },
    { name: '塩化物泉' },
    { name: '炭酸水素塩泉' },
    { name: '硫酸塩泉' },
    { name: '二酸化炭素泉' },
    { name: '含鉄泉' },
    { name: '酸性泉' },
    { name: '含ヨウ素泉' },
    { name: '硫黄泉' },
    { name: '放射能泉' }
    ])

Effect.create!([
    { name: '自律神経不安定症' },
    { name: '不眠症' },
    { name: 'うつ状態' },
    { name: '切傷' },
    { name: '抹消循環障害' },
    { name: '冷え性' },
    { name: '皮膚乾燥症' },
    { name: 'アトピー性皮膚炎' },
    { name: '尋常性乾癬' },
    { name: '表皮化膿症' },
    { name: '糖尿病' },
    { name: '慢性湿疹' },
    { name: '痛風' },
    { name: '関節リウマチ' },
    { name: '強直性脊椎炎' }
    ])

QualityEffect.create!([
    { quality_id: 1, effect_id: 1},
    { quality_id: 1, effect_id: 2},
    { quality_id: 1, effect_id: 3},
    { quality_id: 2, effect_id: 3},
    { quality_id: 2, effect_id: 4},
    { quality_id: 2, effect_id: 5},
    { quality_id: 2, effect_id: 6},
    { quality_id: 3, effect_id: 4},
    { quality_id: 3, effect_id: 5},
    { quality_id: 3, effect_id: 6},
    { quality_id: 3, effect_id: 7},
    { quality_id: 4, effect_id: 3},
    { quality_id: 4, effect_id: 4},
    { quality_id: 4, effect_id: 5},
    { quality_id: 4, effect_id: 6},
    { quality_id: 5, effect_id: 1},
    { quality_id: 5, effect_id: 4},
    { quality_id: 5, effect_id: 5},
    { quality_id: 5, effect_id: 6},
    { quality_id: 7, effect_id: 8},
    { quality_id: 7, effect_id: 9},
    { quality_id: 7, effect_id: 10},
    { quality_id: 7, effect_id: 11},
    { quality_id: 9, effect_id: 8},
    { quality_id: 9, effect_id: 9},
    { quality_id: 9, effect_id: 10},
    { quality_id: 9, effect_id: 12},
    { quality_id: 10, effect_id: 13},
    { quality_id: 10, effect_id: 14},
    { quality_id: 10, effect_id: 15}
    ])

Tag.create!([
    { name: '複数泉質' },
    { name: '貸切風呂' },
    { name: '露天' },
    { name: '絶景' },
    { name: 'サウナ' },
    { name: 'むし湯' },
    { name: '砂湯' },
    { name: '泥湯' },
    { name: '酵素風呂' },
    { name: 'シャワー有' },
    { name: 'ドライヤー有' },
    { name: '休憩所有' },
    { name: 'タトゥー可' },
    { name: '混浴' },
    { name: '駐車場有' },
    { name: 'にごり湯' },
    { name: '源泉掛け流し' },
    { name: '21時以降営業' },
    { name: '水着着用' },
    { name: 'アメニティ充実' }
    ])

# HotSpring.create!([
#     {name: "別府海浜砂湯", introduction: "海沿いにある砂湯です。1度に10名以上が入浴できグループの方もいっしょに楽しむことができます。可動式屋根があるので雨天時でも入浴できます。休憩所あり。源泉かけ流しです。", address: "大分県別府市上人ケ浜町", price: "1500円", private_bath_price: "-", hours: "【3月～11月】8時30分～18時（最終受付17時）【12月～2月】9時～17時（最終受付16時）", holiday: "毎月第4水曜日（祝日の場合は翌日）", parking: "10台", contact: "電話：0977-66-5737", running_status: 0, is_pablished: 2, quality_ids: 2, tag_ids: [4, 7, 11, 15, 17] },
#     {name: "柴石温泉", introduction: "療養効果の高い温 泉地として国民保養温泉地、国民保健温泉地として指定されています。温度の違う2つの温泉や露天風呂・ 蒸し湯があり、家天風呂・ 蒸し湯があり、家族湯も利用可能。源泉掛け流しです。", address: "大分県別府市野田4組", price: "大人300円、小人100円", private_bath_price: "2000円（1時間4人まで）", hours: "【普通浴】7：00～20：00 【家族湯】9：00～20：00 （最終受付19：00） ※14：00～15：00までの1時間は清掃時間のため、入館・入浴はできません", holiday: "毎月第2水曜日（祝日の場合は翌日）", parking: "35台", contact: "電話：0977-67-4100", running_status: 0, is_pablished: 1, quality_ids: [1,2], tag_ids: [1, 2, 3, 6, 10, 11, 15, 17] },
#     {name: "芝居の湯", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shibai.jpeg"), filename:"shibai.jpeg"), introduction: "天井が高く、2階まで吹き抜けの空間になっており、開放感があります。ゆったりとした浴槽の中からは外の美しい庭園を楽しむことができます。うたせ湯も併設しています。", address: "大分県別府市上野口町29番13号", price: "大人（中学生以上）300円、小人100円", private_bath_price: "-", hours: "11時～21時（最終受付20時30分）", holiday: "火曜", parking: "30台", contact: "電話：0977-24-5320", running_status: 1, is_pablished: 1, quality_ids: 1, tag_ids: [10, 11, 15] },
#     {name: "堀田温泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/horita.jpg"), filename:"horita.jpg"), introduction: "内湯、露天風呂の楽しめる、市営温泉です。 休憩室もあり、くつろげます。 引湯かけ流し。", price: "大人300円、小人100円", private_bath_price: "-", hours: "6：30～22：30 ※14：00～15：00までの1時間は清掃時間のため、入館・入浴はできません。", holiday: "第1水曜日（祝日の場合は翌日）", address: "大分県別府市堀田2組", parking: "約30台", contact: "電話：0977-24-9418", running_status: 0, is_pablished: 1, quality_ids: 1, tag_ids: [3, 10, 11, 12, 15, 18] },
#     {name: "絶景の宿さくら亭", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sakuratei.jpg"), filename:"sakuratei.jpg"), introduction: "グロリアグループ系列のホテルの温泉です。日帰り入浴可能です。作りは小さいですが、岩盤浴、サウナ、水風呂と揃っています。源泉掛け流し。", price: "500円", private_bath_price: "-", hours: "10:00～16:00", holiday: "無休 (清掃による臨時休あり、要問合せ)", address: "大分県別府市鉄輪上1063-1", parking: "20台", contact: "電話：0977-27-6747", running_status: 0, is_pablished: 2, quality_ids: 2, tag_ids:[3,4,5,10,11,17,20] },
#     {name: "湯けむりの里東屋", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/azumaya.jpg"), filename:"azumaya.jpg"), introduction: "半露天のお風呂とサウナが楽しめます。景色がとても良いです。源泉掛け流し。", address: "大分県別府市鉄輪上4", price: "500円", private_bath_price: "-", hours: "10:00〜16:00（要問合せ）", holiday: "無休", parking: "9台", contact: "電話：0977-27-7547", is_pablished: 1, running_status: 0, quality_ids: 2, tag_ids:[3,4,5,10,11,12,15,17,20] },
#     {name: "豊前屋旅館", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/buzenya.jpg"), filename:"buzenya.jpg"), introduction: "電話予約のみの受付で1日3組限定のお宿。源泉かけ流しの旅館の温泉は、立ち寄り湯も可能です。内風呂のみですが、景色が良いです。", address: "大分県別府市明礬２組", price: "500円", private_bath_price: "家族湯はないが貸切利用は可能", hours: "11:00〜16:00（宿泊のお客様の混雑具合に寄る）", holiday: "無休", parking: "5台", contact: "電話：0977-66-0537", is_pablished: 1, running_status: 0, quality_ids: 9, tag_ids:[4,10,15,16,17] },
#     {name: "浜田温泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hamada.jpg"), filename:"hamada.jpg"), introduction: "段差がなく、手すりが設置されるなど、バリアフリーを意識した設計となっている市営温泉です。お湯は、引湯掛流し。向かいに資料館があります。", address: "大分県別府市亀川浜田町991番地6", price: "大人200円、小人100円", private_bath_price: "-", hours: "6時30分～22時30分 ※12時～13時までの1時間は清掃時間のため、入館・入浴はできません。", holiday: "第1木曜日（祝日のときは変更の場合あり）", parking: "28台", contact: "電話：0977-67-2619", is_pablished: 1, running_status: 0, quality_ids: 2, tag_ids:[10,15,18] },
#     {name: "照湯温泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/teruyu.jpg"), filename:"teruyu.jpg"), introduction: "別府で一番歴史の古い湯と言われていますが、2003年にリニューアルし、手入れも行き届いた綺麗な温泉です。単純泉ですが、明礬らしい硫黄臭も感じられ、日によって濁り具合が変わります。温泉の蒸気に地下水を流し厳選を作り出しており、温度が高いため加水調整ありです。入浴前に3つで100円の温泉卵を頼むと、湯上がりに楽しむことができます。", address: "大分県別府市小倉5組-1", price: "300円", private_bath_price: "-", hours: "9:00〜21:00", holiday: "なし", parking: "15台", contact: "電話：0977-51-4272", is_pablished: 1, running_status: 0, quality_ids: 1, tag_ids:[12,15,18] },
#     {name: "七ツ石温泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/nanatuishi.jpg"), filename:"nanatuishi.jpg"), introduction: "神社の中にある温泉です。", address: "大分県別府市荘園2組", price: "100円", private_bath_price: "-", hours: "7:00～10:00/15:00〜22:00", holiday: "無休", parking: "2台", contact: "電話：090-6427-4658", is_pablished: 1, running_status: 0, quality_ids: 1, tag_ids:[11,15,18] },
#     {name: "四の湯温泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shinoyu.jpg"), filename:"shinoyu.jpg"), introduction: "半地下で天井が高く、脱衣所一体型の広い空間に小判型浴槽があり開放的です。", address: "大分県別府市亀川四の湯20-4", price: "200円", private_bath_price: "-", hours: "7:00〜10:30（受付10：15）14：30〜22:00（受付21：45）", holiday: "毎月5・15・25日", parking: "5台", contact: "なし", is_pablished: 1, running_status: 0, quality_ids: 1, tag_ids:[15,18] },
#     {name: "競輪温泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/keirinn.jpg"), filename:"keirinn.jpg"), introduction: "競輪場の敷地の中に温泉があります。温泉遊浴だけの利用も可能です。", address: "大分県別府市亀川東町1-36別府競輪駐車場内", price: "110円", private_bath_price: "-", hours: "7:00〜22:00", holiday: "不定（ひと月2日程度）", parking: "約1000台", contact: "電話：0977-67-2626", is_pablished: 1, running_status: 0, quality_ids: 1, tag_ids:[15,18] },
#     {name: "亀陽泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kiyousen.jpg"), filename:"kiyousen.jpg"), introduction: "2016年に改装した市営温泉。熱湯とぬる湯があります。", address: "大分県別府市亀川中央町10-26", price: "大人250円　小人100円", private_bath_price: "-", hours: "6:30〜13:00　14:00～22:30", holiday: "第1水曜日（祝日の場合翌日）", parking: "3台", contact: "電話：0977-66-2666", is_pablished: 1, running_status: 0, quality_ids: 1, tag_ids:[10,11,12,15,18] },
#     {name: "みかゑり温泉", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mikaeri.jpg"), filename:"mikaeri.jpg"), introduction: "金気香る食塩泉。温泉に入った人は地獄釜を無料で使用できます（食材持参または購入、肉と魚以外）。", address: "大分県別府市火売8組2", price: "300円", private_bath_price: "1000円", hours: "10:00〜受付21:00", holiday: "なし", parking: "20台", contact: "電話：0977-66-1186", is_pablished: 1, running_status: 0, quality_ids: 2, tag_ids:[2,3,6,12,15] },
#     {name: "わくわく温泉かっぱの湯", hot_spring_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kaxtupa.jpg"), filename:"kaxtupa.jpg"), introduction: "スーパー銭湯のような温泉。ジェットバスなどの湯船を楽しめます。", address: "大分県別府市汐見町3番17号", price: "440円", private_bath_price: "-", hours: "12:00～翌朝9：00、土・日曜、祝日24時間", holiday: "不定（毎月１回）", parking: "80台", contact: "電話：0977-21-0600", is_pablished: 1, running_status: 0, quality_ids: 2, tag_ids:[3,5,10,11,12,15,18] },
#     {name: "スーパー温泉やまなみの湯", introduction: "スーパー銭湯の温泉バージョン。リニューアルし、セルフロウリュを導入するなど、サウナ設備を拡大、外気浴スペースも確保されています。", address: "大分県別府市北中7-2　ダイちゃんランド内", price: "480円", private_bath_price: "60分　2000円～", hours: "12：00 ~ 翌8 : 40（月2回月曜日は15:00より開店）土日、祝日は24時間営業", holiday: "なし", parking: "700台", contact: "電話：0977-67-4126", is_pablished: 1, running_status: 0, quality_ids: 1, tag_ids:[2,3,5,10,11,12,15,18] },
#     {name: "おかたの湯", introduction: "家族湯専門の温泉施設です。ケイ酸分が多く美肌効果があります。2室源泉掛流し、その他の部屋コイン入替え式", address: "大分県別府市竹の内5組", price: "貸切湯のみ", private_bath_price: "貸切湯1500円～", hours: "11:00〜受付22:00、土・日曜・祝日9:00〜受付22:00", holiday: "不定休", parking: "20台", contact: "電話：0977-22-4126", is_pablished: 1, running_status: 0, quality_ids: 1, tag_ids:[2,3,10,11,13,15,17,18] },
#     {name: "ひょうたん温泉", introduction: "世界で初めて、竹製温泉冷却装置を設置。ミシュランガイドにも掲載されており、観光観光客が多く訪れます。改装され、設備も充実、綺麗で雰囲気のある温泉です。", address: "大分県別府市鉄輪159-2", price: "21:00まで　13歳以上 860円 7～12歳 380円 4～6歳 260円 3歳以下 無料　※21:00以降値下げあり", private_bath_price: "基本料金１時間（大人3名様まで） 2300円", hours: "9:00〜深夜1:00", holiday: "年２～３回臨時休業", parking: "80台", contact: "電話：0977-66-0527", is_pablished: 1, running_status: 0, quality_ids: 2, tag_ids:[2,3,5,6,7,10,11,12,13,15,18] }
#     ])

# reviews = Review.create!([
#     {title: "コスパ最高！", body: "地元の方が多いですが回転が速いので気になりません。この値段でシャワーがあり、露天風呂もあるので最高です！", rate: 5.0, hot_spring_id: 4, user_id: 1, is_pablished: true},
#     {title: "仕事帰りに！", body: "毎日仕事帰りに寄っています。熱湯とぬる湯があり、子供連れでも安心です。堀田温泉と同じお湯を引いているようですが、温泉を濾しているので浮遊物は少ないです。管理の方が温度を頻繁にチェックされているので快適に入浴できます。", rate: 4.5, hot_spring_id: 3, user_id: 1, is_pablished: true},
#     {title: "春は桜が咲きます", body: "浴室からは見えませんが、建物のそばを流れる川に桜の木が並んでいるので春は良い感じです。", rate: 3.5, hot_spring_id: 3, user_id: 1, is_pablished: true},
#     {title: "ザ・地元の温泉", body: "広い市営温泉です。露天やむし湯もあり、コスパが良いです。地元の人が多く、マナーに少し厳しいかもしれません。駐車場に入る道が急カーブかつ傾斜が急なので、気をつけてください。", rate: 4.0, hot_spring_id: 2, user_id: 1, is_pablished: true},
#     {title: "海を眺めながら", body: "気温が低く天気が良い日に行くと最高かと思います。寒い季節は空気が澄んでいるので、おすすめです！", rate:4.0, hot_spring_id: 1, user_id: 1, is_pablished: true}
#     ])
# reviews[4].images.attach(io: File.open("#{Rails.root}/db/fixtures/review1.jpg"), filename:"review1.jpg")
# reviews[4].save!
# reviews[2].images.attach(io: File.open("#{Rails.root}/db/fixtures/review2.jpg"), filename:"review2.jpg")
# reviews[2].save!
