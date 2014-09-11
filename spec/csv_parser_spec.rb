require 'spec_helper'
require 'assets/csv_parser'

describe 'CsvParser' do

  it 'should write seeds file' do
    IO.write('db/seeds.rb', '')

    CsvParser.new('lib/assets/Animals.csv')
    expect(File.open('db/seeds.rb').gets).to eq('Brain.create(animal: "Mountain beaver", body: 1.35, brain: 8.1)
')
    expect(IO.readlines('db/seeds.rb').length).to eq(28)
    IO.write('db/seeds.rb', '')
  end
end