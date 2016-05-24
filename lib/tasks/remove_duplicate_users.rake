namespace :db do

  desc "Destroy duplicate users"
  task :remove_duplicates => :environment do

    # To get all distinct email records ids
    ids = User.select("MIN(id) as id").group(:email).collect(&:id)
    # Get all duplicate records and destroy
    User.where.not(id: ids).destroy_all
    
    # To get all distinct name records ids
    ids = User.select("MIN(id) as id").group(:name).collect(&:id)
    # Get all duplicate records and destroy
    User.where.not(id: ids).destroy_all

  end

end