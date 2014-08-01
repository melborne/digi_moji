require 'spec_helper'

describe DigiMoji::CLI do
  before do
    $stdout = StringIO.new
    @str_A = "  \e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m  \n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m\n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m\n\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m\n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m\n\e[47m \e[0m\e[47m \e[0m      \e[47m \e[0m\e[47m \e[0m\n"

    @str_colored_A = "\e[42m \e[0m\e[42m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[42m \e[0m\e[42m \e[0m\n\e[41m \e[0m\e[41m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[41m \e[0m\e[41m \e[0m\n\e[41m \e[0m\e[41m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[41m \e[0m\e[41m \e[0m\n\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\e[41m \e[0m\n\e[41m \e[0m\e[41m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[41m \e[0m\e[41m \e[0m\n\e[41m \e[0m\e[41m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[41m \e[0m\e[41m \e[0m\n\e[41m \e[0m\e[41m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[42m \e[0m\e[41m \e[0m\e[41m \e[0m\n"

    @str_slim_A = "A\e[47mA\e[0m\e[47mA\e[0m\e[47mA\e[0mA\n\e[47mA\e[0mAAA\e[47mA\e[0m\n\e[47mA\e[0mAAA\e[47mA\e[0m\n\e[47mA\e[0m\e[47mA\e[0m\e[47mA\e[0m\e[47mA\e[0m\e[47mA\e[0m\n\e[47mA\e[0mAAA\e[47mA\e[0m\n\e[47mA\e[0mAAA\e[47mA\e[0m\n\e[47mA\e[0mAAA\e[47mA\e[0m\n"
  end

  after do
    $stdout = STDOUT
  end

  describe "new" do
    it "prints a digital string" do
      DigiMoji::CLI.start(['new', 'A'])
      expect($stdout.string).to eq @str_A
    end

    context "with options" do
      it "prints a digital string with options" do
        DigiMoji::CLI.start(['new', 'A', '--fg', 'bg_red', '--bg', 'bg_green'])
        expect($stdout.string).to eq @str_colored_A
      end

      it "prints a slim A by A cells" do
        DigiMoji::CLI.start(['new', 'A', '--cell', 'A', '--width', 1])
        expect($stdout.string).to eq @str_slim_A
      end
    end
  end
end
