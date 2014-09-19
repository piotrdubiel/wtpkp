require "wtpkp/version"
require "wtpkp/query"
require "wtpkp/config"
require "wtpkp/course"
require "tzinfo"

module WTPKP
  URL = "http://rozklad-pkp.pl/bin/query.exe/pn?"
  TIMEZONE = TZInfo::Timezone.get('Europe/Warsaw')
end
