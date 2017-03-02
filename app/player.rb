class Player
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name   = name
  end

  def self.responses
    [1, 2]
  end

end
