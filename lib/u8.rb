require 'u8/command'

module U8
  class << self
  
    def _
      @_
    end

    def echo *args
      args = args.is_a?(Array) ? args.join("\n") : args
      puts args.to_s
    end

    #def config
    def command cmd, args={}
      U8::Command.new(cmd,args)
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

    private

    def exec name, args
      `cd #{@dir};#{exec_s(name,args_to_s(args))}`
    end

    def exec_s name, args
      "#{name} #{args_to_s(args)}"
    end

    def method_missing(name, *args, &block)
      #move to own method
      @_ = exec(name,args).split("\n")
    end

    def args_to_s options, args
      if args.is_a? Hash
        options[:equals] = '=' if options[:equals] == true
        equals = options[:equals] 
        equals ||= ' '
        args = args.collect{|k,v| 
          args[k] = "#{k}#{equals}#{v}"
        }

      end

      prefix = options[:prefix] || ''
        
      args.map{ |arg|
        "#{prefix}#{arg}"
      }.join(" ")
    end

  end
end
