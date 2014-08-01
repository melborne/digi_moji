require 'spec_helper'

describe DigiMoji::Char do
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

    @A = [
      "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ",
      "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m",
      "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m",
      "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m",
      "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m",
      "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m",
      "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m"
      ]

    @A2 = [
      "\e[43m \e[0m\e[43m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[43m \e[0m\e[43m \e[0m",
      "\e[42m \e[0m\e[42m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[42m \e[0m\e[42m \e[0m",
      "\e[42m \e[0m\e[42m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[42m \e[0m\e[42m \e[0m",
      "\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m",
      "\e[42m \e[0m\e[42m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[42m \e[0m\e[42m \e[0m",
      "\e[42m \e[0m\e[42m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[42m \e[0m\e[42m \e[0m",
      "\e[42m \e[0m\e[42m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[42m \e[0m\e[42m \e[0m"
      ]

    @A3 = [
      "AA\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0mAA",
      "\e[31mA\e[0m\e[31mA\e[0mAAAAAA\e[31mA\e[0m\e[31mA\e[0m",
      "\e[31mA\e[0m\e[31mA\e[0mAAAAAA\e[31mA\e[0m\e[31mA\e[0m",
      "\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m\e[31mA\e[0m",
      "\e[31mA\e[0m\e[31mA\e[0mAAAAAA\e[31mA\e[0m\e[31mA\e[0m",
      "\e[31mA\e[0m\e[31mA\e[0mAAAAAA\e[31mA\e[0m\e[31mA\e[0m",
      "\e[31mA\e[0m\e[31mA\e[0mAAAAAA\e[31mA\e[0m\e[31mA\e[0m"
      ]
  end

  describe ".build_char_map" do
    it "returns a boolean map for an alphabet" do
      expect(DigiMoji::Char.build_char_map(:A)).to eq @MAP_A
    end

    it "returns a boolean map for a number" do
      expect(DigiMoji::Char.build_char_map(1)).to eq @MAP_ONE
    end

    it "returns a boolean map for a sign" do
      expect(DigiMoji::Char.build_char_map('?')).to eq @MAP_QUESTION
    end

    it "raises an error for unknown charcters" do
      expect{ DigiMoji::Char.build_char_map('#')}.to raise_error(DigiMoji::Char::NotImplementError)
    end
  end

  describe ".[]" do
    it "returns a digital character in white" do
      expect(DigiMoji::Char[:A]).to eq @A
    end

    context "with options" do
      it "returns green 'A' with yellow background" do
        expect(DigiMoji::Char[:A, fg:'bg_green', bg:'bg_yellow']).to eq @A2
      end

      it "returns red 'A' constructed A cells" do
        expect(DigiMoji::Char[:A, fg:'red', cell:'A']).to eq @A3
      end
    end
  end
end
