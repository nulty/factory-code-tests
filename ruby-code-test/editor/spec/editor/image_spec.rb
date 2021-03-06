require 'spec_helper'

describe Image do

  before do
    @test_grid = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

    @fill_grid = [["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
                  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"]]
  end

  let(:args) { ["10", "10"] }
  let(:image) { Image.new(*args) }

  it "creates a new grid" do
    expect(image.grid).to match_array @test_grid
  end

  describe "invalid arguments" do
    it "is invalid with '0' argument" do
      expect{Image.new(["5", "0"])}.to raise_error(ArgumentError)
    end

    it "is invalid with '0' argument" do
      expect{Image.new(["5", "0"])}.to raise_error(ArgumentError)
    end

    it "is invalid with '251' argument" do
      expect{Image.new(["5", "251"])}.to raise_error(ArgumentError)
    end

    it "is invalid with three arguments" do
      expect{Image.new(["5", "25", "14"])}.to raise_error(ArgumentError)
    end

    it "is invalid with one arguments" do
      expect{Image.new(["14"])}.to raise_error(ArgumentError)
    end
  end

  describe "#print_image" do
    let(:image) { Image.new(5,5) }

    it "prints the image to the IO" do
      STDOUT.should_receive(:write).with("00000").exactly(5).times
      STDOUT.should_receive(:write).with("\n").exactly(5).times
      image.print_image
    end
  end

  describe "#color_pixel" do
    let(:image) { Image.new(5,5) }

    it "prints the image to the IO" do
      color = "X"
      expect{image.color_pixel(2,2, color)}.to change {image.grid[2][2]}.to(color)
    end
  end

  describe "#vertical_color" do
    let(:image) { Image.new(15,15) }

    it "colours the correct pixels" do
      color = "X"
      expect{image.vertical_color("6", "9", "12", color)}.to change {image.grid[(9..12)].map {|r| r[6]}}.to(Array.new(4, "X"))
    end

    it "raises ArgumentError if from is bigger than to" do
      color = "X"
      expect{image.vertical_color("6", "13", "12", color)}.to raise_error(ArgumentError)
    end
  end

  describe "#horizontal_color" do
    let(:image) { Image.new(15,15) }

    it "colours the correct pixels" do
      color = "X"
      expect{image.horizontal_color("9", "12", "6", color)}.to change {image.grid[6][(9..12)]}.to(Array.new(4, "X"))
    end

    it "raises ArgumentError if from is bigger than to" do
      color = "X"
      expect{image.horizontal_color("13", "12", "6", color)}.to raise_error(ArgumentError)
    end
  end

  describe "#fill_color" do
    let(:image) { Image.new(10,10) }

    it "colours the correct pixels" do
      color = "-"
      image.replace_color("3", "3", color)
      expect(image.grid).to eq @fill_grid
    end

    context 'image with altered pixels' do

      before(:each) do
        image.grid[5][5] = "N"
      end

      it "doesnt color unmatched pixels" do
        expect(image.grid[5][5]).to eq "N"
        color = "-"
        image.replace_color("3", "3", color)
        expect(image.grid[5][5]).to eq "N"
      end
    end
  end

  describe "#clear_image" do
    let(:image) { Image.new(10,10) }

    before(:each) do
      image.grid[5][2..6] = Array.new(5, "T")
      image.grid[9] = Array.new(10, "%")
    end

    it "resets the grid to all 0" do
      image.clear_image
      expect(image.grid).to eq @test_grid
    end
  end
end