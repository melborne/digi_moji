require 'spec_helper'

describe DigiString::Char do
  before do
    @A = [[false, true, true, true, false],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true]]

    @ONE = [[false, false, true, false, false],
            [false, true, true, false, false],
            [false, false, true, false, false],
            [false, false, true, false, false],
            [false, false, true, false, false],
            [false, false, true, false, false],
            [true, true, true, true, true]]

    @QUESTION = [[false, true, true, true, false],
                 [true, false, false, false, true],
                 [true, false, false, false, true],
                 [false, false, false, true, false],
                 [false, false, true, false, false],
                 [false, false, false, false, false],
                 [false, false, true, false, false]]
  end

  describe ".build_char_map" do
    it "returns a map for an alphabet" do
      expect(DigiString::Char.build_char_map(:A)).to eq @A
    end

    it "returns a map for a number" do
      expect(DigiString::Char.build_char_map(1)).to eq @ONE
    end

    it "returns a map for a sign" do
      expect(DigiString::Char.build_char_map('?')).to eq @QUESTION
    end

    it "raises an error for unknown charcters" do
      expect{ DigiString::Char.build_char_map('#')}.to raise_error(DigiString::Char::NotImplementError)
    end
  end
end
