# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(name: '管理者',email: 'admin@shogiplace.com',password: 'aaaaaa')

Customer.create!(
  [
    {name: '将棋太郎', email: 'aaa@sample.com', password: 'aaaaaa', date_of_birth: '2000-01-01', gender: 0, chess_ability: 'アマ初段', profile: 'よろしくお願いします。',membership_status: 0},
    {name: '桂棋譜名木',email: 'bbb@sample.com',password: 'bbbbbb',date_of_birth: '2007-3-3',gender: 1,chess_ability: 'アマ四段',profile: 'まっすぐ進む香車が好きな駒です。 居玉は避ける主義なので持久戦が好きです。',membership_status: 0},
    {name: '香子',email: 'ccc@sample.com',password: 'cccccc',date_of_birth: '1996-9-9',gender: 1,chess_ability: 'アマ初段',profile: '',membership_status: 0},
    {name: '銀河',email: 'ddd@sample.com',password: 'dddddd',date_of_birth: '1996-7-7',gender: 0,chess_ability: '初心者',profile: ''},
    {name: '金沢凪',email: 'eee@sample.com',password: 'eeeeee',date_of_birth: '2009-6-30',gender: 0,chess_ability: 'アマ三段',profile: '',membership_status: 0},
    {name: '飛騨さん',email: 'fff@sample.com',password: 'ffffff',date_of_birth: '1990-2-8',gender: 0,chess_ability: 'アマ初段',profile: '',membership_status: 0},
    {name: '角成',email: 'ggg@sample.com',password: 'gggggg',date_of_birth: '1993-8-8',gender: 0,chess_ability: 'アマ二段',profile: '',membership_status: 0},
    {name: '有栖',email: 'qqq@sample.com',password: 'qqqqqq',date_of_birth: '2009-10-10',gender: 1,chess_ability: 'アマ五段',profile: '好きな駒は金将です。',membership_status: 0},
    {name: '司',email: 'ttt@sample.com',password: 'tttttt',date_of_birth: '2007-7-7',gender: 0,chess_ability: 'アマ三段',profile: 'よろしくお願いします。',membership_status: 0},
    {name: '奈紗',email: 'yyy@sample.com',password: 'yyyyyy',date_of_birth: '2006-7-7',gender: 1,chess_ability: 'アマ五段',profile: '',membership_status: 0}
  ]
 )

TargetAudience.create!(
  [
    {name: '初心者向け'},
    {name: '有段者向け'},
    {name: '子供向け'},
    {name: '大人向け'},
  ]
)

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

PostShogiPlace.create!(
  [
    {customer_id: Customer.find_by(name:'将棋太郎').id,prefecture_id: Prefecture.find_by(name:'東京').id,name: '東京将棋会館',address: '東京都千駄ヶ谷区2丁目39-9',telephone_number: '123-456-7890',explanation: '東京にある将棋会館で２Fの将棋道場で対局ができます。手合い係の人が同じくらいの棋力の人と手合いをつけてくれるので、初めての人でも安心です。たくさん人がいて賑やかです。'},
    {customer_id: Customer.find_by(name:'桂棋譜名木').id,prefecture_id: Prefecture.find_by(name:'大阪').id,name: '関西将棋会館',address: '大阪府大阪市福島区6丁目3-11関西将棋会館',telephone_number: '987-6543-210',explanation: '関西にある将棋会館です。色々な強さの人がいるので棋力に関係なく楽しめます。 １Fには売店があります。'},
    {customer_id: Customer.find_by(name:'香子').id,prefecture_id: Prefecture.find_by(name:'香川').id,name: '香川道場',address: '香川県高松市',telephone_number: '333-3333-3333',explanation: '月一回将棋大会が行われています。 強い人が集まっているので有段者向けです。'},
    {customer_id: Customer.find_by(name:'有栖').id,prefecture_id: Prefecture.find_by(name:'東京').id,name: '東京道場',address: '東京都東品川',telephone_number: '222-222-2222',explanation: '強い人が集まる場所です。腕に自信がある人向けです。'},
    {customer_id: Customer.find_by(name:'将棋太郎').id,prefecture_id: Prefecture.find_by(name:'北海道').id,name: '北海道将棋教室',address: '北海道札幌市',telephone_number: '555-555-5555',explanation: '将棋教室がメインです。初心者向けです。 ゆっくり丁寧に教えてくれるので初めての人でも安心です。'},
    {customer_id: Customer.find_by(name:'司').id,prefecture_id: Prefecture.find_by(name:'奈良').id,name: '奈良将棋教室',address: '奈良県奈良市',telephone_number: '666-666-6666',explanation: '奈良県にある将棋教室です。初心者向けです。'},
    {customer_id: Customer.find_by(name:'奈紗').id,prefecture_id: Prefecture.find_by(name:'東京').id,name: '東京道場',address: '東京都東品川',telephone_number: '222-222-2222',explanation: '強い人がたくさんいました。対局後に感想戦を行い、とても勉強になりました。'}
  ]
  )


