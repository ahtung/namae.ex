defmodule NameSpec do
  use ESpec
  
  describe "new" do

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
  
  describe "initials" do
    let :name, do: Name.new(%{family: "Poe", given: "Edgar A."})
    
    it "returns the name's initials" do
      expect(Name.initials(name)).to eq("E.A.P.")
    end

    it "returns the name's initials but leaves the family name expanded" do
      expect(Name.initials(name, expand: true)).to eq("E.A. Poe")
    end
  end
end
