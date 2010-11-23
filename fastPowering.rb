class FastPowering
  attr_accessor :base, :power, :mod, :bits ,:ans, :versobe_mode
  
  def initialize(arg)
    if arg.length <= 3
      @versobe_mode = false
      @base = arg[0] != nil ? arg[0].to_i : 3
      @power = arg[1] != nil ? arg[1].to_i : 218
      @mod = arg[2] != nil ? arg[2].to_i : 1000
      
    elsif arg.length == 4
      v = arg[0]
      @versobe_mode = v == "-v" || v == "-o" || v == "-O" || v == "--output" ? true : false
      @base = arg[1] != nil ? arg[1].to_i : 3
      @power = arg[2] != nil ? arg[2].to_i : 218
      @mod = arg[3] != nil ? arg[3].to_i : 1000
    end
    @ans = 1
  end
  
  def calculate
    @bits = @power.to_s(2)    
    i=0
    puts "#{@power} = #{@bits}" if @versobe_mode
    @bits.reverse.each_char do |bit|
      if bit == "1"
        @ans *= (@base**(2**i)) % @mod
        if @versobe_mode
          print("#{@base}^2^#{i} : "+"#{@base**(2**i)% @mod}"+"\n")
        end
      end
      
      i+=1
    end
    puts "Result : #{@ans % @mod}"
    
  end
end

job = FastPowering.new(ARGV)

job.calculate

