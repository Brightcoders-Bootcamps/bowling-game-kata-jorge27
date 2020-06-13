require_relative "../lib/bowling.rb"

describe "Bowling" do 
	describe "#capture" do
		context "Probando la captura de datos" do
			it "Capturando texto" do
				expect(Bowling.new.capture("hola","mundo")).to eq(nil)
				expect(Bowling.new.capture("c","k")).to eq(nil)
				expect(Bowling.new.capture("a","p")).to eq(nil)
				expect(Bowling.new.capture("no","ñ")).to eq(nil)
				expect(Bowling.new.capture("q","p")).to eq(nil)
			end
			it "Capturando numeros enormes" do
				expect(Bowling.new.capture(78,452)).to eq(nil)
				expect(Bowling.new.capture(29,102)).to eq(nil)
				expect(Bowling.new.capture(800,2)).to eq(nil)
				expect(Bowling.new.capture(12,11)).to eq(nil)
				expect(Bowling.new.capture(48,87)).to eq(nil)
			end
			it "Comprobando caracteres sospechosos" do
				expect(Bowling.new.capture("`","'")).to eq(nil)
				expect(Bowling.new.capture(",",".")).to eq(nil)
				expect(Bowling.new.capture(":",";")).to eq(nil)
				expect(Bowling.new.capture("ê","ñ")).to eq(nil)
				expect(Bowling.new.capture("ü","@")).to eq(nil)
			end
			it "Capturando tiros imposibles" do
				expect(Bowling.new.capture(3,10)).to eq(nil)
				expect(Bowling.new.capture(10,2)).to eq(nil)
				expect(Bowling.new.capture(5,7)).to eq(nil)
				expect(Bowling.new.capture(6,6)).to eq(nil)
				expect(Bowling.new.capture(3,9)).to eq(nil)
			end
			it "Capturando Valores correctos" do
				expect(Bowling.new.capture(3,5)).to eq(0..2)
				expect(Bowling.new.capture(7,3)).to eq(0..2)
				expect(Bowling.new.capture(10,0)).to eq(0..2)
				expect(Bowling.new.capture(0,10)).to eq(0..2)
				expect(Bowling.new.capture(2,3)).to eq(0..2)
			end
		end
	end
	describe "#calculate" do
		context "Comprobando puntuación generada" do
			it 'Probando juego...' do
				test1 = Bowling.new
				test1.capture(1,4)
				expect(test1.calculate).to eq([5,0,0,0,0,0,0,0,0,0])
				test1.capture(4,5)
				expect(test1.calculate).to eq([5,14,0,0,0,0,0,0,0,0])
				test1.capture(6,4)
				expect(test1.calculate).to eq([5,14,24,0,0,0,0,0,0,0])
				test1.capture(5,5)
				expect(test1.calculate).to eq([5,14,29,39,0,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([5,14,29,49,59,0,0,0,0,0])
				test1.capture(0,1)
				expect(test1.calculate).to eq([5,14,29,49,60,61,0,0,0,0])
				test1.capture(7,3)
				expect(test1.calculate).to eq([5,14,29,49,60,61,71,0,0,0])
				test1.capture(6,4)
				expect(test1.calculate).to eq([5,14,29,49,60,61,77,87,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([5,14,29,49,60,61,77,97,107,0])
				test1.capture(2,8)
				expect(test1.calculate).to eq([5,14,29,49,60,61,77,97,117,127])
				test1.capture(6,0)
				expect(test1.calculate).to eq([5,14,29,49,60,61,77,97,117,133])
			end
			it 'Probando segundo juego...' do
				test1 = Bowling.new
				test1.capture(5,5)
				expect(test1.calculate).to eq([10,0,0,0,0,0,0,0,0,0])
				test1.capture(7,3)
				expect(test1.calculate).to eq([17,27,0,0,0,0,0,0,0,0])
				test1.capture(9,1)
				expect(test1.calculate).to eq([17,36,46,0,0,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([17,36,56,66,0,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([17,36,56,76,86,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([17,36,56,86,106,116,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([17,36,56,86,116,136,146,0,0,0])
				test1.capture(9,1)
				expect(test1.calculate).to eq([17,36,56,86,116,145,165,175,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([17,36,56,86,116,145,165,185,195,0])
				test1.capture(9,1)
				expect(test1.calculate).to eq([17,36,56,86,116,145,165,185,205,215])
				test1.capture(9,0)
				expect(test1.calculate).to eq([17,36,56,86,116,145,165,185,205,224])
			end

			it "Probando Chuzas..." do
				test1 = Bowling.new
				test1.capture(10,0)
				expect(test1.calculate).to eq([10,0,0,0,0,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([20,30,0,0,0,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,50,60,0,0,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,60,80,90,0,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,60,90,110,120,0,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,60,90,120,140,150,0,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,60,90,120,150,170,180,0,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,60,90,120,150,180,200,210,0,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,60,90,120,150,180,210,230,240,0])
				test1.capture(10,0)
				expect(test1.calculate).to eq([30,60,90,120,150,180,210,240,260,270])
				test1.capture(10,10)
				expect(test1.calculate).to eq([30,60,90,120,150,180,210,240,270,300])
			end
		end
	end
end