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

game1 = Game.create(
  :title => 'Basketball at bedok',
  :venue => 'Bedok',
  :players_required => 2,
  :cost => '$20',
  :special_requirements => 'players need to be at least 1.5m tall',
  :start => DateTime.parse('3rd Aug 2020 15:05:00+08:00'),
  :end => DateTime.parse('3rd Aug 2020 18:05:00+08:00'),
  :category_id => 2,
  :host_id => 1,
)

game2 = Game.create(
  :title => 'Soccer with friends',
  :venue => 'Ang Moh Kio',
  :players_required => 3,
  :cost => '$10',
  :special_requirements => 'casual game',
  :start => DateTime.parse('20th Sept 2020 09:00:00+08:00'),
  :end => DateTime.parse('20th Sept 2020 11:00:00+08:00'),
  :category_id => 1,
  :host_id => 2,
)

game3 = Game.create(
  :title => 'Boss run maplestory',
  :venue => 'Online',
  :players_required => 1,
  :cost => 'free',
  :special_requirements => 'Only high level players',
  :start => DateTime.parse('2nd July 2020 04:00:00+08:00'),
  :end => DateTime.parse('2nd July 2020 06:00:00+08:00'),
  :category_id => 6,
  :host_id => 1,
)

game4 = Game.create(
  :title => 'more basketball',
  :venue => 'Simei',
  :players_required => 5,
  :cost => 'free',
  :special_requirements => 'gonna be really fun',
  :start => DateTime.parse('20th Jun 2020 15:05:00+08:00'),
  :end => DateTime.parse('20th Jun 2020 18:05:00+08:00'),
  :category_id => 2,
  :host_id => 1,
)

game5 = Game.create(
  :title => 'Even more basketball',
  :venue => 'Tampines',
  :players_required => 5,
  :cost => 'free',
  :special_requirements => 'gonna be really fun',
  :start => DateTime.parse('21st Jun 2020 15:05:00+08:00'),
  :end => DateTime.parse('21st Jun 2020 18:05:00+08:00'),
  :category_id => 2,
  :host_id => 1,
)

game6 = Game.create(
  :title => 'soccer things',
  :venue => 'Kallang',
  :players_required => 1,
  :cost => '$20',
  :special_requirements => 'full field',
  :start => DateTime.parse('21st Jun 2020 15:05:00+08:00'),
  :end => DateTime.parse('21st Jun 2020 18:05:00+08:00'),
  :category_id => 1,
  :host_id => 1,
)

id_list = [1, 2, 3]

id_list.each do |id|
  Room.create(game_id: id)
end