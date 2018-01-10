defmodule NameSpec do
  use ESpec
  
  describe ".new" do

    it "returns an empty name by default" do
      expect(Name.new).to eq(%Name{})
    end

    it "sets all passed-in attributes" do
      expect(Name.new(%{family: "Foo"}).family).to eq("Foo")
    end

    it "ignores unknown attributes" do
      expect(Name.new(%{foo: "bar"})).to eq(%Name{})
    end
  end
end
