# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
    {username: 'user001', 
     email: 'user001@example.com',
     password: 'Secret1',
     password_confirmation: 'Secret1'
    },
    {username: 'user002', 
        email: 'user002@example.com',
        password: 'Secret1',
        password_confirmation: 'Secret1'
    },
    {username: 'user003', 
        email: 'user003@example.com',
        password: 'Secret1',
        password_confirmation: 'Secret1'
    }
])

User.first.create_event( 
    {
        title: 'User001\'s Birthday Party: 45 years old!',
        date: '2021-01-01 22:00:00.000000000 -0000',
        location: 'User001\'s Place'}
)
User.first.create_event( 
    {
        title: 'User001\'s Birthday Party: 46 years old!',
        date: '2022-01-01 22:00:00.000000000 -0000',
        location: 'User001\'s Place'}
)
User.second.create_event( 
    {
        title: 'User002\'s Birthday Party: 15 years old!',
        date: '2021-02-01 22:00:00.000000000 -0000',
        location: 'User002\'s Place'}
)
User.second.create_event( 
    {
        title: 'User002\'s Birthday Party: 16 years old!',
        date: '2022-02-01 22:00:00.000000000 -0000',
        location: 'User002\'s Place'}
)

Attendee.create([
    {
        user_id: User.second.id,
        event_id: Event.first.id
    },
    {
        user_id: User.third.id,
        event_id: Event.first.id
    },
    {
        user_id: User.second.id,
        event_id: Event.second.id
    },
    {
        user_id: User.third.id,
        event_id: Event.second.id
    },
    {
        user_id: User.first.id,
        event_id: Event.third.id
    },
    {
        user_id: User.third.id,
        event_id: Event.third.id
    },
    {
        user_id: User.first.id,
        event_id: Event.fourth.id
    },
    {
        user_id: User.third.id,
        event_id: Event.fourth.id
    }
])
