# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'admin@admin',
    password: 'adminadmin',
    password_confirmation: 'adminadmin',
)

members = Member.create!(
  [
    {last_name: '田中', first_name: '太郎', nickname: 'タロウ',email: 'tanaka@test1.com', phone_number: '01234', password: 'password', password_confirmation: 'password', best_image_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"), filename:"sample-member1.jpg")},
    {last_name: '山田', first_name: '花子', nickname: 'ハナコ',email: 'yamada@test2.com', phone_number: '12345', password: 'password', password_confirmation: 'password', best_image_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member2.jpg"), filename:"sample-member2.jpg")},
    {last_name: '佐藤', first_name: '二郎', nickname: 'ジロー',email: 'sato@test3.com', phone_number: '23456', password: 'password', password_confirmation: 'password', best_image_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member3.jpg"), filename:"sample-member3.jpg")},
    {last_name: '鈴木', first_name: '三郎', nickname: 'サブ',email: 'suzuki@test4.com', phone_number: '34567', password: 'password', password_confirmation: 'password', best_image_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member4.jpg"), filename:"sample-member4.jpg")},
    {last_name: '佐々木', first_name: '桃子', nickname: 'モモ',email: 'sasaki@test5.com', phone_number: '45678', password: 'password', password_confirmation: 'password', best_image_id: '', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member5.jpg"), filename:"sample-member5.jpg")},
    {last_name: '退会', first_name: 'する子', nickname: 'タイカイ',email: 'taikai@test6.com', phone_number: '56789', password: 'password', password_confirmation: 'password', best_image_id: '', is_deleted: 'true', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member6.jpg"), filename:"sample-member6.jpg")},
  ]
)

Photo.create!(
  [
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo1.jpg"), filename:"sample-photo1.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo2.jpg"), filename:"sample-photo2.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo3.jpg"), filename:"sample-photo3.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo4.jpg"), filename:"sample-photo4.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo5.jpg"), filename:"sample-photo5.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo6.jpg"), filename:"sample-photo6.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo7.jpg"), filename:"sample-photo7.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo8.jpg"), filename:"sample-photo8.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo9.jpg"), filename:"sample-photo9.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo10.jpg"), filename:"sample-photo10.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo11.jpg"), filename:"sample-photo11.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[1].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-photo12.jpg"), filename:"sample-photo12.jpg"), body: '大人気のカフェです。', address: '横浜公園', member_id: members[1].id },
  ]
)