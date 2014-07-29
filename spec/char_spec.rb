require 'spec_helper'

describe DigiString::Char do
  before do
    @MAP_A = [[false, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true]]

    @MAP_ONE = [[false, false, true, false, false],
            [false, true, true, false, false],
            [false, false, true, false, false],
            [false, false, true, false, false],
            [false, false, true, false, false],
            [false, false, true, false, false],
            [true, true, true, true, true]]

    @MAP_QUESTION = [[false, true, true, true, false],
                 [true, false, false, false, true],
                 [true, false, false, false, true],
                 [false, false, false, true, false],
                 [false, false, true, false, false],
                 [false, false, false, false, false],
                 [false, false, true, false, false]]
  end

  describe ".build_char_map" do
    it "returns a boolean map for an alphabet" do
      expect(DigiString::Char.build_char_map(:A)).to eq @MAP_A
    end

    it "returns a boolean map for a number" do
      expect(DigiString::Char.build_char_map(1)).to eq @MAP_ONE
    end

    it "returns a boolean map for a sign" do
      expect(DigiString::Char.build_char_map('?')).to eq @MAP_QUESTION
    end

    it "raises an error for unknown charcters" do
      expect{ DigiString::Char.build_char_map('#')}.to raise_error(DigiString::Char::NotImplementError)
    end
  end

  describe ".[]" do
    it "returns a digital charcter" do
      pending
      expect(DigiString::Char[:A]).to eq @A
    end
  end
end
