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
    # TODO: make this method reusable for both repositories
  end

  def save_csv
    # TODO: make this method reusable for both repositories
  end
end
