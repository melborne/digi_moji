require "thor"

module DigiString
  class CLI < Thor
    desc "new WORD", "Print a digital word"
    option :fg, aliases:'-f', desc:'Foreground color'
    option :bg, aliases:'-b', desc:'Background color'
    def new(word)
      opts = down_symbolize_key(options)
      str = String.new(word, opts)
      puts str
    end

    no_tasks do
      def down_symbolize_key(opts)
        opts.inject({}) do |h, (k, v)|
          h[k.to_s.downcase.intern] = v; h
        end
      end
    end
  end
end