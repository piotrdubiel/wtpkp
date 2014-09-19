require "mechanize"
require "wtpkp/course"

module WTPKP
  class Query
    def initialize(origin:, destination:, time: Time.now.utc)
      @origin = origin
      @destination = destination
      @mechanize = Mechanize.new
      @time = TIMEZONE.utc_to_local(time || Time.now.utc)
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
        departures = departures_page.search('.tpOverview > :nth-child(5), .selected > :nth-child(5)')
          .map do |departure|
            departure.children.map(&:to_s).select { |t| t =~ /\d\d:\d\d/ }
          end
        stations = departures_page.search('.tpOverview > :nth-child(2), .selected > :nth-child(2)')
          .map do |station|
            station.children
              .select { |c| c.is_a? Nokogiri::XML::Text }
              .map(&:to_s)
              .map(&:strip)
              .select { |c| not c.empty? }
              .compact
          end
        stations.select! { |s| not s.empty? }

        result = stations.zip(departures).map do |record|
          Course.new origin: record[0][0], destination: record[0][1], departure: record[1][0], arrival: record[1][1]
        end
        return result.sort
      end
    end
  end
end
