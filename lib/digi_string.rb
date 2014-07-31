require "digi_string/version"
require "digi_string/char"

require "colcolor"

module DigiString
  class String
    attr_reader :map
    def initialize(str, space:1, **opts)
      head, *rest = str.to_s.each_char.map { |chr| Char[chr.intern, opts] }
      joint = (" " * space).colco(opts[:bg], regexp:/./)
      @map = head.zip(*rest).map { |e| e.join(joint) }
    end
  end
end
