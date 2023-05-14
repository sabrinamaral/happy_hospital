# frozen_string_literal: true

require 'csv'
# patients repository class
class PatientRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    @next_id = 1
    # @room_id
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    # @room_id = patient.room.id
    save_csv
  end

  def list
    @patients
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
