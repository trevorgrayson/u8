module U8
  class Command

    def initialize cmd, args={}
      @cmd = cmd.to_sym
      @options = args
    end

    def method_missing *args
      @options
      U8.class_eval :exec, @cmd, args
    end
  end
end
