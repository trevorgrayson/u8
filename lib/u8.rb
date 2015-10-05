module U8
  class << self
  
    def _
      @_
    end

    def echo *args
      args = args.is_a?(Array) ? args.join("\n") : args
      puts args.to_s
    end

    def shell &block
      U8.instance_eval &block
    end

    def interactive
      while 1
        echo eval(gets)
      end
    rescue StandardError => e
      echo e.message
      interactive
    end

    def method_missing(name, *args, &block)
      @_ = `cd #{@dir};#{name} #{args.join(" ")}`.split("\n")
    end

  end
end
