namespace :db do
  desc 'Import data from CSV files'
  task import: :environment do
    require 'csv'

    count = 0
    print 'Creating repositories'
    repository_for = create_mapping file: 'repository.csv', valuefield: 'repository_name' do |value|
      print '.'
      count += 1
      Repository.find_or_create_by name: value
    end
    puts "Done (#{count})"
    puts "Created #{Repository.count} repositories from #{count} rows"

    count = 0
    print 'Creating names'
    name_for = create_mapping file: 'initials.csv', valuefield: 'initials_name' do |value|
      print '.'
      count += 1
      Name.find_or_create_by initials: value
    end
    puts "Done (#{count})"
    puts "Created #{Name.count} names from #{count} rows"

    count = 0
    print 'Creating autonumbers'
    CSV.foreach(File.path('autonumber.csv'), headers: true) do |row|
      id = row.field('autonumber_id').to_i
      date = row.field('entry_date')
      name_id = row.field('initials_id').to_i
      repository_id = row.field('repository_id').to_i

      print '.'
      count += 1
      print count if count % 1000 == 0
      AutoNumber.create(id:, entry_date: date, name: name_for[name_id], repository: repository_for[repository_id])
    end
    puts "Done (#{count})"
    puts "Created #{AutoNumber.count} autonumbers from #{count} rows"
  end
end

def create_mapping(opts)
  object_for = {}
  get_ids_for(opts).each do |value, ids|
    object = yield value
    ids.each do |id|
      object_for[id] = object
    end
  end
  object_for
end

def get_ids_for(opts)
  ids_for = {}
  CSV.foreach(File.path(opts[:file]), headers: true) do |row|
    id = row.field('id').to_i
    value = row.field(opts[:valuefield]).downcase.strip
    value = '[blank]' if value == ''
    ids_for[value] = [] unless ids_for.key? value
    ids_for[value] << id
  end
  ids_for
end
