require 'pry'

class Jogo

  def initialize
  @dia = 1
  @deadline = 3
  @cota_inicial = rand(50..100)
  @cota = @cota_inicial
  @creditos = 0
  end

  def iniciar_novo_jogo
    puts "\e[2J\e[f"
    sleep(1)
    puts 'Iniciando novo jogo...'
    sleep(2)

    loop do
      puts "\n Hoje é Dia #{@dia}, e seu Creditos atuais são: #{@creditos}"
      puts "\n Voce tem #{@deadline} dias para bater sua cota de #{@cota} creditos"
      puts "\n »»Digite o destino no terminal?««"
      puts "Ganimedes »»————————«« Japeto"
      puts "Oberon    »»————————«« Nereida"
      print "Terminal: "
      destino = gets.chomp.capitalize
      
      case destino
      when "Ganimedes"
        sleep(1)
        puts "\n A maior lua de Júpiter te recebe com sua atmosfera fina e superficie gelada."
        puts "Apesar dos grandes esforços feitos para colonização da lua, sua distancia"
        puts "de Jupiter e do sol provaram ser um desafio muito grande e a ideia fora"
        puts "descartada. Agora somente restam pequenas estruturas de colonias falhas"
        sleep(1)

        ganhos = rand(50..150)
        puts "\n seus ganhos hoje foram #{ganhos}"
        sleep(1)
        @creditos += ganhos
        @deadline -= 1
        @dia += 1

      when "Japeto"
        puts "\n Japeto"

        ganhos = rand(40..170)
        puts "\n seus ganhos hoje foram #{ganhos}"
        sleep(1)
        @creditos += ganhos
        @deadline -= 1
        @dia += 1
      when "Oberon"
        puts "\n Oberon"

        ganhos = rand(30..180)
        puts "\n seus ganhos hoje foram #{ganhos}"
        sleep(1)
        @creditos += ganhos
        @deadline -= 1
        @dia += 1
      when "Nereida"
        puts "\n Nereida"

        ganhos = rand(20..190)
        puts "\n seus ganhos hoje foram #{ganhos}"
        sleep(1)
        @creditos += ganhos
        @deadline -= 1
        @dia += 1
      else
        puts "\e[2J\e[f"
        puts "Comando incorreto, por favor escolha uma das luas listadas: "     
      end

      if @creditos >= @cota
        sleep(1)
        puts "\n Parabéns! Você atingiu a cota diária."
        sleep(1)
        @creditos -= @cota
        @cota += (@cota * rand(0.2..0.5)).to_i
        @deadline = 3
      end
      
      if @deadline == 0
        puts "\e[2J\e[f"
        puts "\n Voce não atingiu a cota necessaria, e sera terminado da empresa"
        sleep(3)
        puts "GAME OVER"
        sleep(3)
        break
      end
    end
  end

  def continuar_jogo
    puts 'Continuando jogo...'

  end
end

class Menu
  def exibir_menu
    menu = <<-MENU
    »»————-　★　————-««        »»————-　★　————-««
    ##     ##    ########    ##    ##    ##     ##
    ###   ###    ##          ###   ##    ##     ##
    #### ####    ##          ####  ##    ##     ##
    ## ### ##    ######      ## ## ##    ##     ##
    ##     ##    ##          ##  ####    ##     ##
    ##     ##    ##          ##   ###    ##     ##
    ##     ##    ########    ##    ##     #######
    »»————-　★　————-««        »»————-　★　————-««
    MENU
    sleep(1)
    puts menu
    puts '  Novo                       Continuar'
    puts '  »»————-　★　————-««        »»————-　★　————-««'
    puts '  Help                       Creditos'
    puts '  »»————-　★　————-««        »»————-　★　————-««'
  end

  def obter_opcao
    print '  Escreva a opção desejada no terminal: '
    gets.chomp.capitalize
  end

  def exibir_mensagem_opcao_invalida
    puts "\e[2J\e[f"
    puts '  »»————-　★　————-««        »»————-　★　————-««'
    puts '  Opção inválida, tente novamente.'
    puts '  »»————-　★　————-««        »»————-　★　————-««'
    sleep(1.5)
  end
end

class Sistema
  def boas_vindas
    puts 'Inicializando Sistemas Primarios'
    puts 'CosmicCoder Alpha V0.1'
    sleep(3)
    print "\e[2J\e[f"
    (0..100).step(10) do |i|
      print "\r[#{'=' * i}#{' ' * (100 - i)}] #{i}%"
      sleep(0.2)
    end

    puts "\nConcluído!"
    puts "Bem-vindo a um novo dia de trabalho"
  end

  def help_menu
    puts 'xxgame help'
    puts 'Escreva os comandos no console para interagir com o jogo'
    puts 'Ajuda Menu - Novo = cria um novo jogo'
    puts '             Continuar = continua o ultimo jogo salvo'
    puts '             Help = voce esta aqui'
    puts '             Creditos = Mostra os creditos do jogo'
    puts '  »»————-　★　————-««        »»————-　★　————-««'
    print '  deseja mais ajuda? S/N: '
    ajuda = gets.chomp.capitalize
    case ajuda
    when 'S'
      Sistema.new.help_game
    when 'N'
      JogoDigitacao.new.iniciar
    else
      Menu.new.exibir_mensagem_opcao_invalida
      JogoDigitacao.new.iniciar
    end
  end

  def creditos
    puts "Jogo programado por Julio Rafael C
    Linguagem: Ruby
    Referencia: Instituto de Fisic da UFRGS
    link: https://www.if.ufrgs.br/if/"
    sleep(3)
    JogoDigitacao.new.iniciar
  end

  def help_game
    #help game
  end
end

class JogoDigitacao
  def initialize
    @jogo = Jogo.new
    @menu = Menu.new
    @sistema = Sistema.new
  end

  def iniciar
    @sistema.boas_vindas

    loop do
      @menu.exibir_menu
      opcao = @menu.obter_opcao

      case opcao
      when 'Novo'
        @jogo.iniciar_novo_jogo
        break
      when 'Continuar'
        @jogo.continuar_jogo
        break
      when 'Help'
        @sistema.help_menu
        break
      when 'Creditos'
        @sistema.creditos
        break
      else
        @menu.exibir_mensagem_opcao_invalida
      end
    end
  end
end

JogoDigitacao.new.iniciar
