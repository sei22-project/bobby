# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

soccer = Category.create(
  :game_type => 'Soccer'
)

basketball = Category.create(
  :game_type => 'Basketball'
)

hockey = Category.create(
  :game_type => 'Hockey'
)

fishing = Category.create(
  :game_type => 'Offshore Fishing'
)

boardGames = Category.create(
  :game_type => 'Board Games'
)

eGames = Category.create(
  :game_type => 'eGames'
)

user1 = User.new(email: 'sgboomers@somemail.com', name: 'SgBoomer')
user1.password = '12345678'
user1.password_confirmation = '12345678';
user1.save

user2 = User.new(email: 'kwansing@somemail.com', name: 'Kwan Sing')
user2.password = '12345678'
user2.password_confirmation = '12345678';
user2.save

user3 = User.new(email: 'stephcurry@somemail.com', name: 'Stephen')
user3.password = '12345678'
user3.password_confirmation = '12345678';
user3.save

user4 = User.new(email: 'ianshalom@somemail.com', name: 'Ian')
user4.password = '12345678'
user4.password_confirmation = '12345678';
user4.save

user5 = User.new(email: 'yusof@somemail.com', name: 'Yusof')
user5.password = '12345678'
user5.password_confirmation = '12345678';
user5.save

user6 = User.new(email: 'marcus@somemail.com', name: 'Marcus')
user6.password = '12345678'
user6.password_confirmation = '12345678';
user6.save

game1 = Game.create(
  :title => 'Basketball like NBA kind',
  :venue => 'Bedok Community Centre',
  :players_required => 4,
  :cost => '$20',
  :special_requirements => 'Players need to be at least 1.5m tall and wear suspenders. Serious.',
  :start => DateTime.parse('3rd Aug 2020 15:05:00+08:00'),
  :end => DateTime.parse('3rd Aug 2020 18:05:00+08:00'),
  :category_id => 2,
  :host_id => 3,
)

game2 = Game.create(
  :title => 'Boomers can play soccer',
  :venue => 'The Cage',
  :players_required => 8,
  :cost => '$20',
  :special_requirements => 'Surgical masks must wear at all times. Google can you get covid from kick ball together. Thx. Post facebook. Post instagram. Tweet.',
  :start => DateTime.parse('20th Sept 2020 09:00:00+08:00'),
  :end => DateTime.parse('20th Sept 2020 11:00:00+08:00'),
  :category_id => 1,
  :host_id => 1,
)

game3 = Game.create(
  :title => 'Boss Run MapleStory',
  :venue => 'MapleStory Korea',
  :players_required => 4,
  :cost => 'free',
  :special_requirements => 'Only high level players. Chiobu preferred.',
  :start => DateTime.parse('2nd July 2020 04:00:00+08:00'),
  :end => DateTime.parse('2nd July 2020 06:00:00+08:00'),
  :category_id => 6,
  :host_id => 2,
)

game4 = Game.create(
  :title => 'Boomers can play hockey',
  :venue => 'Singapore Hockey Federation',
  :players_required => 5,
  :cost => 'free',
  :special_requirements => 'My son say if I boil seahorse together with tongkat ali I can play good game.',
  :start => DateTime.parse('20th Jun 2020 15:05:00+08:00'),
  :end => DateTime.parse('20th Jun 2020 18:05:00+08:00'),
  :category_id => 2,
  :host_id => 1,
)

game5 = Game.create(
  :title => 'Boomers can play chess',
  :venue => 'Tampines, my house. I cook chicken curry.',
  :players_required => 5,
  :cost => 'free',
  :special_requirements => 'Last time ppl say IQ is impt but I think nowsadays EQ more impt esp for chess. See you tomolo.',
  :start => DateTime.parse('21st Jun 2020 15:05:00+08:00'),
  :end => DateTime.parse('21st Jun 2020 18:05:00+08:00'),
  :category_id => 2,
  :host_id => 1,
)

game6 = Game.create(
  :title => 'Boomers can go fishing',
  :venue => 'Longkang behind my house',
  :players_required => 2,
  :cost => '$20',
  :special_requirements => 'Bring a net so we can scoop all the fish without fishing. This call smart.',
  :start => DateTime.parse('21st Jun 2020 15:05:00+08:00'),
  :end => DateTime.parse('21st Jun 2020 18:05:00+08:00'),
  :category_id => 1,
  :host_id => 1,
)

id_list = [1, 2, 3, 4, 5, 6]

id_list.each do |id|
  Room.create(game_id: id)
end