# Secret binary "handshake" decoder.
class SecretHandshake
  COMMANDS = %w(wink double\ blink close\ your\ eyes jump).freeze
  BASE = 2

  attr_accessor :code

  def initialize(code)
    @code = code
  end

  def commands
    self.code = code.is_a?(Integer) ? decimal_to_binary : validate

    cmds = COMMANDS.select.with_index do |_, idx|
      code.reverse[idx] == '1'
    end

    code.size == 5 && code[-1] == '1' ? cmds.reverse : cmds
  end

  private

  def decimal_to_binary
    return '0' if code == 0
    binary_code = ''

    until code == 0
      binary_code << (code % BASE).to_s
      self.code /= BASE
    end

    binary_code.reverse
  end

  def validate
    code.each_char { |char| return '0' unless ('0'...BASE.to_s).cover?(char) }
  end
end
