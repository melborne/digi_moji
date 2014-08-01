require "digi_string/version"
require "digi_string/char"

require "colcolor"

module DigiString
  class String
    attr_accessor :string
    attr_reader :raw_string
    def initialize(str, space:1, **opts)
      @raw_string = str.to_s
      @space = space
      @opts = opts
      @bg = opts[:bg]
      # @string holds a sequence of Char objects.
      @string = str2chars(str, opts)
    end

    def to_s
      head, *rest = @string
      joint = (" " * @space).colco(@bg, regexp:/./)
      head.zip(*rest).map { |e| e.join(joint) }.join("\n")
    end

    def +(other, **opts)
      opts = @opts.merge(opts)
      other =
        case other
        when ::String, ::Symbol
          str2chars(other, opts)
        when DigiString::String
          other.string
        else
          raise "'other' should be a string, symbol or DigiString object."
        end
      self.dup.tap { |s| s.string += other }
    end
    alias :join :+

    def <<(other, **opts)
      @string = (self + other).string
      @raw_string += other.respond_to?(:raw_string) ? other.raw_string : other.to_s
      self
    end

    private
    def str2chars(str, opts)
      str.to_s.each_char.map { |chr| Char[chr.intern, opts] }
    end
  end
end
