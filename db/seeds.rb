# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline

Admin.create!(
    email: 'admin@admin',
    password: 'adminadmin',
    password_confirmation: 'adminadmin',
)

members = Member.create!(
  [
    {last_name: '田中', first_name: '太郎', nickname: 'タロウ',email: 'tanaka@test1.com', phone_number: '01234', password: 'password', password_confirmation: 'password', best_photo_id: '1', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"), filename:"sample-member1.jpg")},
    {last_name: '山田', first_name: '花子', nickname: 'ハナコ',email: 'yamada@test2.com', phone_number: '12345', password: 'password', password_confirmation: 'password', best_photo_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member2.jpg"), filename:"sample-member2.jpg")},
    {last_name: '佐藤', first_name: '二郎', nickname: 'ジロー',email: 'sato@test3.com', phone_number: '23456', password: 'password', password_confirmation: 'password', best_photo_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member3.jpg"), filename:"sample-member3.jpg")},
    {last_name: '鈴木', first_name: '三郎', nickname: 'サブ',email: 'suzuki@test4.com', phone_number: '34567', password: 'password', password_confirmation: 'password', best_photo_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member4.jpg"), filename:"sample-member4.jpg")},
    {last_name: '佐々木', first_name: '桃子', nickname: 'モモ',email: 'sasaki@test5.com', phone_number: '45678', password: 'password', password_confirmation: 'password', best_photo_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member5.jpg"), filename:"sample-member5.jpg")},
  ]
)

Photo.create!(
  [
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo6.jpg"), filename:"sample-photo6.jpg"), body: '景色が綺麗でした', address: '豊島', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo7.jpg"), filename:"sample-photo7.jpg"), body: '快晴の空に観覧車の赤が綺麗でした', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo8.jpg"), filename:"sample-photo8.jpg"), body: '海の中に消える線路が神秘的です', address: '下灘駅', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo9.jpg"), filename:"sample-photo9.jpg"), body: '友人と撮影に行きました', address: '', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo10.jpg"), filename:"sample-photo10.jpg"), body: '紫陽花の季節です', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo11.jpg"), filename:"sample-photo11.jpg"), body: '変わったレンズを使ったので逆光で虹がでました！', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo12.jpg"), filename:"sample-photo12.jpg"), body: '青が綺麗です', address: '京都水族館', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo13.jpg"), filename:"sample-photo13.jpg"), body: '小さい鳥居が積まれていました…！', address: '伏見稲荷', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo14.jpg"), filename:"sample-photo14.jpg"), body: 'イルミネーションを撮影しました', address: '東京駅', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo15.jpg"), filename:"sample-photo15.jpg"), body: '秋の終わりごろに撮影しました', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo16.jpg"), filename:"sample-photo16.jpg"), body: '帰り道によくいる猫です', address: '', member_id: members[1].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo17.jpg"), filename:"sample-photo17.jpg"), body: '友人宅の猫です', address: '', member_id: members[1].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo18.jpg"), filename:"sample-photo18.jpg"), body: '自宅近くによくいる野良猫です', address: '', member_id: members[1].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo19.jpg"), filename:"sample-photo19.jpg"), body: '動物園に行きました', address: '富士サファリパーク', member_id: members[1].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo20.jpg"), filename:"sample-photo20.jpg"), body: 'とても近い距離で撮影できました', address: '富士サファリパーク', member_id: members[1].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo21.jpg"), filename:"sample-photo21.jpg"), body: '街頭の上に鳩がいました', address: '横浜公園', member_id: members[2].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo22.jpg"), filename:"sample-photo22.jpg"), body: 'クローバーが綺麗に咲いていました', address: '横浜公園', member_id: members[2].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo23.jpg"), filename:"sample-photo23.jpg"), body: '蝶を撮影しました', address: '横浜公園', member_id: members[2].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo24.jpg"), filename:"sample-photo24.jpg"), body: '花の撮影です', address: '横浜公園', member_id: members[2].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo25.jpg"), filename:"sample-photo25.jpg"), body: '子猫がいました', address: '', member_id: members[2].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo26.jpg"), filename:"sample-photo26.jpg"), body: '人に慣れている猫でした', address: '豊島', member_id: members[3].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo27.jpg"), filename:"sample-photo27.jpg"), body: '逆光でとても綺麗にペンギンが撮影できました', address: '京都水族館', member_id: members[3].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo28.jpg"), filename:"sample-photo28.jpg"), body: '近距離でキリンを撮影しました', address: '日本平動物園', member_id: members[4].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo29.jpg"), filename:"sample-photo29.jpg"), body: '虎を撮影しました', address: '日本平動物園', member_id: members[4].id },
  ]
)