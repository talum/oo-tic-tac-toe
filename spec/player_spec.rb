require_relative '../app/player.rb'

RSpec.describe Player do
  describe ".responses" do
    it 'holds the valid CLI responses' do
      expect(Player.responses).to eq([1, 2])
    end
  end

end
