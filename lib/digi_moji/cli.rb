require "thor"

module DigiMoji
  class CLI < Thor
    class_option :fg, aliases:'-f', desc:'Foreground color', default:'bg_white'
    class_option :bg, aliases:'-b', desc:'Background color'
    class_option :cell, aliases:'-c', desc:'Cell character'
    class_option :width, aliases:'-w', desc:'Character width', default:2, type: :numeric

    desc "new WORD", "Print a digital word"
    def new(word)
      opts = down_symbolize_key(options)
      str = String.new(word, opts)
      puts str
    end

    desc "time", "Print current time"
    def time
      opts = down_symbolize_key(options)
      trap(:INT) { exit 0 }
      loop do
        time = time_format(Time.at(Time.now.to_i))
        str = String.new(time, opts)
        clear_screen
        puts str
        sleep 1.0
      end
    ensure
      reset_screen
    end

    desc "timer SEC", "Print count down timer"
    option :message, aliases:'-m', desc:"Message on time's up", default:"TIME'S UP!"
    option :message_color, aliases:'-k', desc:"Message color", default:'bg_red'
    option :unit, aliases:'-u', desc:"Argument unit", default:'sec'
    def timer(sec)
      opts = down_symbolize_key(options)
      message, message_color = opts.delete(:message), opts.delete(:message_color)
      unit = opts.delete(:unit)
      t = Time.new('00:00:00') + time_in_sec(sec, unit)
      trap(:INT) { exit 0 }
      loop do
        time = time_format(t)
        str = String.new(time, opts)
        clear_screen
        puts str
        sleep 1.0
        break if [t.hour, t.min, t.sec].all?(&:zero?)
        t -= 1
      end
      clear_screen
      puts String.new(message, fg:message_color)
      sleep 2.0
    ensure
      reset_screen
    end

    no_tasks do
      def down_symbolize_key(opts)
        opts.inject({}) do |h, (k, v)|
          h[k.to_s.downcase.intern] = v; h
        end
      end

      def time_in_sec(time, unit)
        case unit
        when 'sec' then time.to_i
        when 'min' then time.to_i * 60
        when 'hour' then time.to_i * 60 * 60
        else time.to_i
        end
      end

      def clear_screen
        print "\e[?25l" # hide cursor
        print "\e[2J"   # clear screen
        print "\e[2;0H"
      end

      def reset_screen
        print "\e[?25h" # show cursor
      end

      def time_format(t)
        "%02d:%02d:%02d" % [t.hour, t.min, t.sec]
      end
    end
  end
end
