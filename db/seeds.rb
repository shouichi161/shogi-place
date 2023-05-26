# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(name: 'aaa',email: 'a@a.aaa.com',password: 'aaaaaa')

TargetAudience.create([
  {name:'初心者向け'},
  {name:'有段者向け'},
  {name:'子供向け'},
  {name:'大人向け'},
  ])

Prefecture.create(name: '北海道')
Prefecture.create(name: '青森')
Prefecture.create(name: '秋田')
Prefecture.create(name: '岩手')
Prefecture.create(name: '宮城')
Prefecture.create(name: '山形')
Prefecture.create(name: '福島')
Prefecture.create(name: '栃木')
Prefecture.create(name: '茨城')
Prefecture.create(name: '群馬')
Prefecture.create(name: '埼玉')
Prefecture.create(name: '千葉')
Prefecture.create(name: '東京')
Prefecture.create(name: '神奈川')
Prefecture.create(name: '新潟')
Prefecture.create(name: '富山')
Prefecture.create(name: '石川')
Prefecture.create(name: '福井')
Prefecture.create(name: '山梨')
Prefecture.create(name: '長野')
Prefecture.create(name: '岐阜')
Prefecture.create(name: '静岡')
Prefecture.create(name: '愛知')
Prefecture.create(name: '三重')
Prefecture.create(name: '滋賀')
Prefecture.create(name: '京都')
Prefecture.create(name: '大阪')
Prefecture.create(name: '兵庫')
Prefecture.create(name: '奈良')
Prefecture.create(name: '和歌山')
Prefecture.create(name: '鳥取')
Prefecture.create(name: '島根')
Prefecture.create(name: '岡山')
Prefecture.create(name: '広島')
Prefecture.create(name: '山口')
Prefecture.create(name: '徳島')
Prefecture.create(name: '香川')
Prefecture.create(name: '愛媛')
Prefecture.create(name: '高知')
Prefecture.create(name: '福岡')
Prefecture.create(name: '佐賀')
Prefecture.create(name: '長崎')
Prefecture.create(name: '熊本')
Prefecture.create(name: '大分')
Prefecture.create(name: '宮崎')
Prefecture.create(name: '鹿児島')
Prefecture.create(name: '沖縄')

