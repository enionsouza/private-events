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
    },
    {username: 'user004', 
        email: 'user004@example.com',
        password: 'Secret1',
        password_confirmation: 'Secret1'
    }
])

User.first.events.create([
    {
        title: 'User001\'s very first party',
        date: '2022-10-10',
        location: 'Maine Café'
    },
    {
        title: 'User001\'s second party',
        date: '2022-10-12',
        location: 'Maine Night Club'
    }
    ])
User.second.events.create([
    {
        title: 'User002\'s very first party',
        date: '2022-11-10',
        location: 'Maine Café'
    },
    {
        title: 'User002\'s second party',
        date: '2022-11-12',
        location: 'Maine Night Club'
    }
    ])

Event.first.attendances.create([
    {user_id: 2},
    {user_id: 3}
    ])
Event.second.attendances.create([
    {user_id: 2},
    {user_id: 4},
    ])
Event.third.attendances.create([
    {user_id: 1},
    {user_id: 3}
    ])
Event.fourth.attendances.create([
    {user_id: 1},
    {user_id: 4},
    ])

