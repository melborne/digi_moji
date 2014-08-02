require 'spec_helper'

describe DigiMoji do
  it 'has a version number' do
    expect(DigiMoji::VERSION).not_to be nil
  end
end

describe DigiMoji::String do
  before do
    @str_map_a = [["          ", "          ", "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    ", "      \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "]]

    @str_a = "          \n          \n\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    \n      \e[47m \e[0m\e[47m \e[0m  \n  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  \n  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "

    @str_map_Aa = [["  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m"], ["          ", "          ", "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    ", "      \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "]]

    @str_Aa = "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m             \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m           \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    \n\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m       \e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m   \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m \e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m   \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "
  end

  describe ".new" do
    it "builds a character sequence for 'a'" do
      str = DigiMoji::String.new("a")
      expect(str.string).to eq @str_map_a
      expect(str.to_s).to eq @str_a
    end

    it "builds a character sequence for 'Aa" do
      str = DigiMoji::String.new("Aa")
      expect(str.string).to eq @str_map_Aa
      expect(str.to_s).to eq @str_Aa
    end
  end

  describe "#+" do
    subject { DigiMoji::String.new("A") }
    context "pass a string" do
      it "returns a concated digi_moji" do
        str = subject + 'a'
        expect(str.string).to eq @str_map_Aa
      end
    end

    context "pass a DigiMoji object" do
      it "returns a concated digi_moji" do
        str = subject + DigiMoji::String.new('a')
        expect(str.string).to eq @str_map_Aa
      end
    end
  end

  describe "#<<" do
    subject { DigiMoji::String.new("A") }
    context "pass a string" do
      it "returns a concated digi_moji" do
        str = subject << 'a'
        expect(str.string).to eq @str_map_Aa
        expect(str.to_s).to eq @str_Aa
        expect(str.raw_string).to eq 'Aa'
      end
    end

    context "pass a DigiMoji object" do
      it "returns a concated digi_moji" do
        str = subject << DigiMoji::String.new('a')
        expect(str.string).to eq @str_map_Aa
        expect(str.to_s).to eq @str_Aa
        expect(str.raw_string).to eq 'Aa'
      end
    end
  end

  describe String do
    describe "#to_digimoji" do
      it "returns a DigiMoji::String object" do
        str = "Aa".to_digimoji
        expect(str).to be_an_instance_of(DigiMoji::String)
        expect(str.to_s).to eq @str_Aa
      end
    end
  end
end

