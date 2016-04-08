require 'faker'

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task reset_with_sample_data: [:drop, :create, :migrate, :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    # Sample data
    num_repositories = 50
    repositories = Faker::Lorem.words(num_repositories).uniq.shuffle

    repositories.each do |repo_name|
      repository = Repository.new
      repository.name = repo_name
      repository.save!
    end

    num_initials = 100
    letters = ('A'..'Z').to_a
    initials = []
    num_initials.times do
      initials << (letters.sample + letters.sample + letters.sample)
    end

    initials.each do |i|
      name = Name.new
      name.initials = i
      name.save!
    end

    num_entries = 1000
    days_back = 365
    entry_date = Time.zone.today - days_back
    num_entries.times do
      auto_number = AutoNumber.new
      name = Name.find_by_initials(initials.sample)
      repository = Repository.find_by_name(repositories.sample)
      auto_number.name = name
      auto_number.repository = repository
      entry_date += 1 if rand > (days_back.to_f / num_entries)
      entry_date = Time.zone.today if entry_date > Time.zone.today
      auto_number.entry_date = entry_date
      auto_number.save!
    end
  end
end
