class RingTable < Array
  def [](n)
    self[n]=Array.new if super(n) == nil
    super(n)
  end
end

class RingOfModulo
  attr_accessor :add, :mul
  def initialize(m)
    m = m != nil ? m.to_i : 6

    @add = RingTable.new(m)
    @mul = RingTable.new(m)

    m.times do |x|
      @add[x] = Array.new(m,0)
      @mul[x] = Array.new(m,0)
    end

    m.times do |i|
      m.times do |j|
        @add[i][j] = i*j%m
        @mul[i][j] = (i+j)%m
      end
    end
  end
end

h = ARGV[0]
if h == "-o" || h == "-O" || h == "--output"
  m = ARGV[1]
  myRing = RingOfModulo.new(m)

  puts "Addition tables modulo #{m}"
  myRing.add.collect { |a| print('[' + a*','+']'+"\n") }

  puts "Multiplication tables modulo #{m}"
  myRing.mul.collect { |b| print('[' + b*','+']'+"\n") }
end
