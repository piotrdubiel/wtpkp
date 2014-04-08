
module WTPKP
  class Course
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
  end
end
