require 'yaml'

module WTPKP
  class Config
    def self.from_yaml filename
      YAML::load_file(filename).map do |h|
        h.inject({}) do |hash, (k, v)|
          hash[k.to_sym] = v
          hash
        end
      end
    end
  end
end
