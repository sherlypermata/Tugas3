load 'player.rb'
class Game
  @@players = Array.new
  @@mode = "new"
  def initialize
    puts "#===================================#"
    puts "#      Welcome to Battle Arena      #"
    puts "#      pilih 'new' atau 'start'     #"
    puts "#===================================#"
    puts "* max player 2 atau 3"
    play()
  end
  def play
  #terima input dari user
  while !isGameOver() do
    if @@mode.eql? "new" and @@players.length < 3 then
      puts "Pilih mode : "
      input = gets.chomp
    else
      input = "start"
    end

    if input.eql? "new" then
      @@mode = "new"
      #input player name
      puts "Masukkan nama pemain : "
      name = gets.chomp
      @@players.push Player.new name
    elsif input.eql? "start" then
      if @@players.length < 2 then
        puts "Jumlah pemain kurang"
      else
         @@mode = "play"
         puts "Yang akan menyerang : "
         namaPenyerang = gets.chomp
         puts "Yang diserang : "
         namaTarget = gets.chomp
        if namaPenyerang.eql? namaTarget then
          puts "tidak bisa menyerang ke diri sendiri"
        else
          puts "Deskripsi"
          for player in @@players do
            if player.name.eql? namaPenyerang then
              player.serang()
            elsif player.name.eql? namaTarget then
              player.pertahanan()
            end
          puts "#{player.name} : manna = #{player.manna}, blood = #{player.blood}"
        end
     end
  end
    else
      puts "Error input"
    end
  end
      puts "Game Over"
  end
    def isGameOver
    gameOver = false
    for player in @@players do
      gameOver = gameOver || player.isGameOver()
    end
    gameOver
  end
end
game = Game.new
