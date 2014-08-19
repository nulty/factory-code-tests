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

end