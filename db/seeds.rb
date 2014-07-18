# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    users = User.create([{
                           :name =>'Jason',
                           :email => 'lixiang.jiang@gmail.com',
                           :password => '12345',
                           :password_confirmation => '12345'
                         },
                         {
                            :name =>'Jack',
                            :email=>'ljian001@fiu.edu',
                            :password => 'abcde',
                            :password => 'abcde'
                         }
                        ])
    questions= Question.create([{
                                    :content =>'Is bobcat a cat?',
                                    :user_id => users.first.id
                                },
                                {
                                    :content => 'Is Obama the president of US?',
                                    :user_id => users.last.id
                                }])
    Survey.create([{
                       :response =>"true",
                       :question_id =>questions.first.id,
                       :user_id => users.first.id
                   },
                   {
                       :response =>"false",
                       :question_id => questions[1].id,
                       :user_id =>users[1].id}
                  ])