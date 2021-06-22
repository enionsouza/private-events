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
