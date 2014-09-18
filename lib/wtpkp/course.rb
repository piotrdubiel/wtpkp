require "json"

module WTPKP
  class Course
    include Comparable
    attr_reader :origin
    attr_reader :destination
    attr_reader :departure
    attr_reader :arrival

    def initialize(origin:, destination:, departure:, arrival:)
      @origin = origin
      @destination = destination
      @departure = departure
      @arrival = arrival
    end

    def <=> other
      @departure <=> other.departure
    end

    def to_a
      [@origin, @destination, @departure, @arrival]
    end

    def to_json
      {
        origin: @origin
        destination: @destination
        departure: @departure.to_i
        arrival: @arrival.to_i
      }.to_json
    end
  end
end
