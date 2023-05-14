# frozen_string_literal: true

require 'csv'
# rooms repository class
class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      id = row[0].to_i
      name = row[1]
      cured = row[2] == 'true'

      @patients << Patient.new(id: id, name: name, cured: cured)
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb', headers: true) do |csv|
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured]
      end
    end
  end
end
