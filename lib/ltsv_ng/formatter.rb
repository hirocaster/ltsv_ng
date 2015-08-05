module LtsvNg
  class Formatter < ::Logger::Formatter
    def call(severity, timestamp, progname, msg)
      raws = { level: severity, time: timestamp, uuid: SecureRandom.uuid }
      case msg
      when Hash
        msg.each do |key, value|
          if raws.has_key? key
            raws["dup_#{key}".to_sym] = value
          else
            raws[key] = value
          end
        end
      when String
        raws[:msg] = msg
      end

      raws.inject(Array.new) { |h, (key, value)| h << "#{key}:#{value}" }.join("\t") + "\n"
    end
  end
end
