# frozen_string_literal: true

# room class
class Room
  attr_reader :patients
  attr_accessor :id

  class FullRoom < StandardError; end

  def initialize(attributes = {})
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def add(patient)
    raise FullRoom, 'The room is full!' if full?

    patient.room = self
    @patients << patient
  end

  def full?
    @capacity == @patients.length
  end

end
