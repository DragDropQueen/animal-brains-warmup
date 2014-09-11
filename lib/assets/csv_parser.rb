class CsvParser
  def initialize(csv)
    @csv = csv
    @data = ''
    create_seeds
  end

  private

  def create_seeds
    format_data
    write_to_seeds
  end

  def format_data
    IO.foreach(@csv) { |row|
      data = row.rstrip.split(',')

      @data = @data + "Brain.create(animal: #{data[0]}, body: #{data[1]}, brain: #{data[2]})\n" unless data[0] == '"animal"'}
  end

  def write_to_seeds
    IO.write('../../db/seeds.rb', @data, calculate_offset)
  end

  def calculate_offset
    #necessary so if parsing multiple csvs the previous data is not overwritten.
    File.open('../../db/seeds.rb').size
  end
end

#running this file will make the seed file.
CsvParser.new('Animals.csv')