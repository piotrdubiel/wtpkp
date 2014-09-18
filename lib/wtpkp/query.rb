require "mechanize"
require "wtpkp/course"

module WTPKP
  class Query
    def initialize(origin:, destination:, time: Time.now)
      @origin = origin
      @destination = destination
      @mechanize = Mechanize.new
      @time = time
    end

    def fetch
      @mechanize.get(WTPKP::URL) do |page|
        form = page.form_with(:name => 'formular') do |form|
          form.field_with(id: "from").value = @origin
          form.field_with(id: "to").value = @destination
          form.field_with(id: "date").value = @time.strftime("%d.%m.%Y") 
          form.field_with(id: "time").value = @time.strftime("%H:%M")
        end
        departures_page = form.submit(form.button_with(name: 'start'))
        departures = departures_page.search('.tpOverview > :nth-child(5), .selected > :nth-child(5)').map do |departure|
          departure.children.map(&:to_s).select { |t| t =~ /\d\d:\d\d/ }
        end.map do |record|
          Course.new origin: @origin, destination: @destination, departure: record[0], arrival: record[1]
        end
        return departures.sort
      end
    end
  end
end
