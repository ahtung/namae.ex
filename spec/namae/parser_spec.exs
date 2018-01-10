defmodule ParserSpec do
  use ESpec
  
  describe "parse" do
    it "returns an empty list by default" do
      expect(Parser.parse("")).to be_empty
    end
  
    it "returns a list of names" do
      expect(Enum.at(Parser.parse("foo"), 0).__struct__).to eq(Name)
    end
    
    describe "when parsing a single name" do
      it "treats 'Ichiro' as a given name" do
        expect(Enum.at(Parser.parse("Ichiro"), 0).given).to eq("Ichiro")
      end
  
      xit "treats 'Lord Byron' as a title and family name" do
        expect(Enum.at(Parser.parse("Lord Byron"), 0).values_at(:family, :title)).to eq(["Byron", "Lord"])
      end
  
      xit "parses given and family part name in 'Ichiro Suzuki'" do
        expect(Enum.at(Parser.parse("Ichiro Suzuki"), 0).values_at(:given, :family)).to eq(["Ichiro", "Suzuki"])
      end
      # 
      # xit "parses given, nick and family part name in 'Yukihiro \"Matz\" Matsumoto'" do
      #   expect(parser.parse!("Yukihiro \"Matz\" Matsumoto")[0].values_at(:given, :family, :nick)).to eq(%w{Yukihiro Matsumoto Matz})
      # end
      # 
      # xit "parses given, nick and family part name in \"Yukihiro "Matz" Matsumoto\"" do
      #   expect(parser.parse!("Yukihiro "Matz" Matsumoto")[0].values_at(:given, :family, :nick)).to eq(%w{Yukihiro Matsumoto Matz})
      # end
      # 
      # xit "parses appellation and nick in \"Mr. Yukihiro "Matz" Matsumoto\"" do
      #   expect(parser.parse!("Mr. Yukihiro "Matz" Matsumoto")[0].values_at(:appellation, :nick)).to eq(%w{Mr. Matz})
      # end
      # 
      # xit "parses suffix and nick in \"Yukihiro "Matz" Matsumoto Jr.\"" do
      #   expect(parser.parse!("Yukihiro "Matz" Matsumoto Jr.")[0].values_at(:suffix, :nick)).to eq(%w{Jr. Matz})
      # end
      # 
      # xit "parses given and family name in "Poe, Edgar A."" do
      #   expect(parser.parse!("Poe, Edgar A.")[0].values_at(:given, :family)).to eq(["Edgar A.", "Poe"])
      # end
      # 
      # %w{Mr. Mr Mrs. Ms Herr Frau Miss}.each do |appellation|
      #   xit "recognizes #{appellation.inspect} as an appellation" do
      #     expect(parser.parse!([appellation, "Edgar A. Poe"].join(" "))[0].appellation).to eq(appellation)
      #   end
      # end
  
      # xit "parses common Jr. as a suffix in sort order" do
      #   expect(parser.parse!("Griffey, Jr., Ken")[0].values_at(:given, :family, :suffix)).to eq(["Ken", "Griffey", "Jr."])
      #   expect(parser.parse!("Griffey, Ken, Jr.")[0].values_at(:given, :family, :suffix)).to eq(["Ken", "Griffey", "Jr."])
      # end
      # 
      # xit "parses common Jr. as a suffix in display order" do
      #   expect(parser.parse!("Ken Griffey Jr.")[0].values_at(:given, :family, :suffix)).to eq(["Ken", "Griffey", "Jr."])
      # end
      # 
      # xit "parses Ph.D. title suffix in display order" do
      #   expect(parser.parse!("Bernado Franecki Ph.D.")[0].values_at(:given, :family, :title)).to eq(["Bernado", "Franecki", "Ph.D."])
      #   #expect(parser.parse!("Bernado Franecki, Ph.D.")[0].values_at(:given, :family, :title)).to eq(["Bernado", "Franecki", "Ph.D."])
      # end
    end
  end
  
  describe "normalize" do
    it "trims spaces" do
      expect(Parser.normalize(" foo ")).to eq("foo")
    end
    
    xit "normalizes the input" do
      expect(Parser.normalize("abc\u3042\x81")).to eq("abc\u3042\uFFFD")
    end
  end
end
