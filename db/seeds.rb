# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Returns the hash digest of the given string.
def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

# password_digest: #{User.digest('foobar')} )

User.find_or_create_by(name: 'Marcus Stavola', email: 'm.stavola@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'T. J. McFadden', email: 't.j.McFadden@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'test', email: 'test@test.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Phoenix Dabrid', email: 'firebird@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Jerry Bombard', email: 'jerry.bombard@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Josh Brown', email: 'jb@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Test', email: 'test@test.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Marcus Stavola', email: 'M.Stavola@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Aaron Pharel', email: 'aaPharel@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Steve Ferriola', email: 'stevey@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Woofy Wooferson', email: 'woofy.wooferson@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Don O Van', email: 'Don.O.Van@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Fred Black', email: 'freddy@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Jill McDuff', email: 'jill.mcDuff@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Jill Henry', email: 'jill_number_2@superior_construction.com', password_hash: "#{User.digest('password')}")
User.find_or_create_by(name: 'Janine Hill', email: 'j.hill@superior_construction.com', password_hash: "#{User.digest('password')}")

Project.find_or_create_by(name: "Donna's Patio", description: "Donna is requesting a new patio")
Project.find_or_create_by(name: "Jake's House", description: "A ranch style house with a 2 door garage")
Project.find_or_create_by(name: "Phils Moving Van", description: "Phil needs a custom van to move his stuff back to Ohio")
