module Endless
  class App < Sinatra::Base
    register Sinatra::Async

    class DataStream
      include EventMachine::Deferrable

      def stream(data)
        @block.call(data)
      end

      def each(&block)
        @block = block
      end
    end

    def randomLetters(length)
      s = []
      length.times do
        s << 97+rand(26)
      end
      s.pack('c' * s.size)
    end

    aget '/endless' do
      out = DataStream.new
      body(out)
      EM.next_tick do
        timer = EM.add_periodic_timer(0.001) do
          s = randomLetters(8191)
          s << "\n"
          out.stream(s)
        end
      end
    end
  end
end
