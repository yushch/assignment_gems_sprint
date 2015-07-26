require "rps_ysc/version"

module RpsYsc
  # Your code goes here...
        class Rps
            def self.play
                user = Play.new
                user.start
            end
        end

        class Score
            
           def judge(w1, w2)
               
              #scissor = 1 paper = 2 and rock = 3, the result is based
              #on the production of 2 numbers indeed
              puts "it's a draw" if w1 == w2
              puts "scissor cut paper" if w1 * w2 == 2
              puts "paper surround rock" if w1 * w2 == 6
              puts "rock crack scissor" if w1 * w2 == 3
              
           end
           
        end
        
        class Input
            attr_accessor :weapon
            #initialize the weapons
            def init
                @weapon = 0
            end
            
            def enter(name)
                
                puts "#{name}, choose the weapon you want"
                puts "scissor:1, paper:2, rock:3, use numbers to enter"
                puts "illegal enter will be asked to do it again, you can choose to quit by pressing q"
                
                @weapon = gets.chomp
                
                abort "you choose to quit" if @weapon == "q"
                @weapon = @weapon.to_i
                while ![1,2,3].include?(@weapon) do
                    puts "you input is illegal, do it again" 
                    @weapon = gets.chomp.to_i
                end
                
                
                @weapon
                
            end
            
            def ai
                @weapon = [1,2,3].sample
                @weapon
            end
        end
        
        class Play
            def start
                puts"welcome to the game"
                
                loop do 
                    user = Input.new
                    user.init
                    w1 = user.enter("user")
                    pc = Input.new
                    pc.init
                    w2 = pc.ai
                    vs = Score.new
                    vs.judge(w1,w2)
                    w1,w2 = 0, 0
                    
                end
            end
        end

end#end of the module
