module LtsvNg
  class Formatter < ::Logger::Formatter
    def call(severity, timestamp, progname, msg)
      raws = ["level:#{ severity }", "time:#{ timestamp }", "uuid:#{ SecureRandom.uuid }"]
      case msg
      when Hash
        raws = msg.inject(raws) { |h, (key, value)| h << "#{key}:#{value}"; h }
      when String
        raws << "msg:#{ msg }"
      end
      "#{raws.join("\t")}\n"
    end
  end
end
