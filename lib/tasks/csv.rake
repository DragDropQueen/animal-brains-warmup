require 'assets/csv_parser'

namespace :csv do
  desc 'runs csv parser'
  task :parse do
    CsvParser.new('lib/assets/Animals.csv')
  end
end