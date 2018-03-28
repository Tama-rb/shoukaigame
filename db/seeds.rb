# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
conj_list = %w(そして 
               だから
               ちなみに 
               厳密には 
               ところで 
               さて 
               でも 
               だと思ったら
               これからは
              )

conj_list.each do |conj|
  Conjunction.create(conjunction: conj)
end

ques_list = %w(彼氏いますか？
               彼女いますか？
               貯金いくらですか？
               最近見た映画はなんですか？
               明日は何する予定ですか？
               昨晩何食べました？
               好きなテレビゲームは？
               あなたを動にたとえると？
               )

ques_list.each do |ques|
  Question.create(question: ques)
end

theme_list = %w(森友学園ついて
                高齢化について
                ブラック企業について
                LGBTについて
                )

theme_list.each do |theme|
  Theme.create(theme: theme)
end

puts "接続詞 数:" + Conjunction.all.count.to_s
puts "質問   数:" + Question.all.count.to_s
puts "テーマ 数:" + Theme.all.count.to_s

