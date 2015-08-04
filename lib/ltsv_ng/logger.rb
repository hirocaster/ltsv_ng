module LtsvNg
  class Logger < ::Logger
    def initialize(*args)
      super
      @formatter = LtsvNg::Formatter.new
    end
  end
end
