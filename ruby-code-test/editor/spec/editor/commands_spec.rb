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
  end

end