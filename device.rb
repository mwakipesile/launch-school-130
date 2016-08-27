class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    save(recording)
  end

  def save(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    @recordings.each { |recording| puts recording }
  end
end
