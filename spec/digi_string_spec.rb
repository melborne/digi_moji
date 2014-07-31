require 'spec_helper'

describe DigiString do
  it 'has a version number' do
    expect(DigiString::VERSION).not_to be nil
  end
end

describe DigiString::String do
  before do
    @str_map = ["  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m             ", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m           ", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m    ", "\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m       \e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m   \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m \e[47m \e[0m\e[47m \e[0m    \e[47m \e[0m\e[47m \e[0m  ", "\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m   \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  "]
  end

  describe ".new" do
    it "builds string map" do
      str = DigiString::String.new("Aa")
      expect(str.map).to eq @str_map
    end
  end
end
