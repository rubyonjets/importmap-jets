$:.unshift(File.expand_path("../", __FILE__))

require "importmap_jets/autoloader"
ImportmapJets::Autoloader.setup

require "memoist"
require "rainbow/ext/string"
require "importmap"
require "importmap_jets/engine"

module ImportmapJets
  class Error < StandardError; end
end
