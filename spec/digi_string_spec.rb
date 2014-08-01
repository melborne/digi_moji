require 'spec_helper'

describe DigiString do
  it 'has a version number' do
    expect(DigiString::VERSION).not_to be nil
  end
end

describe DigiString::String do
  before do
    @str_map_a = [["          ", "          ", "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    ", "      \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "]]

    @str_a = "          \n          \n\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    \n      \e[47m \e[0m\e[47m \e[0m  \n  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  \n  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "

    @str_map_Aa = [["  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m"], ["          ", "          ", "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    ", "      \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  ", "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "]]

    @str_Aa = "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m             \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m           \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    \n\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m       \e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m   \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m \e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m   \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "
  end

  describe ".new" do
    it "builds a character sequence for 'a'" do
      str = DigiString::String.new("a")
      expect(str.string).to eq @str_map_a
      expect(str.to_s).to eq @str_a
    end

    it "builds a character sequence for 'Aa" do
      str = DigiString::String.new("Aa")
      expect(str.map).to eq @str_map
    end
  end

end
