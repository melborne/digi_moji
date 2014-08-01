require "thor"

module DigiString
  class CLI < Thor
    desc "new WORD", "Print a digital word"
    option :fg, aliases:'-f', desc:'Foreground color', default:'bg_white'
    option :bg, aliases:'-b', desc:'Background color'
    option :cell, aliases:'-c', desc:'Cell character'
    option :width, aliases:'-w', desc:'Character width', default:2, type: :numeric
    def new(word)
      opts = down_symbolize_key(options)
      str = String.new(word, opts)
      puts str
    end

    desc "time", "Print current time"
    option :fg, aliases:'-f', desc:'Foreground color', default:'bg_white'
    option :bg, aliases:'-b', desc:'Background color'
    option :cell, aliases:'-c', desc:'Cell character'
    option :width, aliases:'-w', desc:'Character width', default:2, type: :numeric
    def time
      opts = down_symbolize_key(options)
      screen_size = IO.console.winsize.map { |n| n / 2 }
      trap(:INT) do
        print "\e[?25h"
        print "\e[0;0H"
        exit(0)
      end
      loop do
        time = Time.at(Time.now.to_i)
                   .tap { |t| break "%02d:%02d:%02d" % [t.hour, t.min, t.sec] }
        str = String.new(time, opts)
        clear_screen
        print str
        sleep 1.0
      end
    end

    no_tasks do
      def down_symbolize_key(opts)
        opts.inject({}) do |h, (k, v)|
          h[k.to_s.downcase.intern] = v; h
        end
      end

      def clear_screen
        print "\e[?25l"
        print "\e[2J"
        print "\e[2;0H"
      end
    end
  end
end