require 'spec_helper'

describe CommandLine do

  describe "#new" do
    context "with I command" do

      let(:args) { "I 3 5" }
      let(:input) { CommandLine.new(args) }

      it "creates a new command line" do
        expect(input.command).to eq("I")
      end

      it "creates a new command line" do
        expect(input.args).to eq(["3", "5"])
      end
    end

    context "with S command" do

      let(:args) { "S" }
      let(:input) { CommandLine.new(args) }

      before do
        CommandLine.new("I 5 5")
        # CommandLine.should_receive(:image).and_return(image)
        Image.any_instance.should_receive(:print_image)
      end

      it "creates a new command line" do
        expect(input.command).to eq("S")
      end

      it "creates a new command line" do
        expect(input.args).to eq([])
      end

    end
  end

end