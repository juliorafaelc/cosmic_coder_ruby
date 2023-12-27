require 'pry'
require 'json'
module CosmicCoder
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
        puts "\n Insira Help no terminal para acessar todos os comandos possiveis"
        puts "\n »»Digite o destino no terminal?««"
        puts "Ganimedes »»————————«« Japeto"
        puts "Oberon    »»————————«« Nereida"
        print "Terminal: "
        destino = gets.chomp.capitalize
        
        #criar função para cada lua que sera disponivel e apenas usar o case para direcionar a ação para cada função
  
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
          puts "\n Uma estranha lua de Saturno, sua superficie coberta por material organico escuro,"
          puts "semelhante aquele encontrado em asteroides, sua temperatura constante e equilibrada"
          puts "gera confusão pois sempre se mantem na faixa dos 30º, o motivo pelo qual esta lua"
          puts "não fora colonizada é informação restrita para o publico"
  
          ganhos = rand(40..170)
          puts "\n seus ganhos hoje foram #{ganhos}"
          sleep(1)
          @creditos += ganhos
          @deadline -= 1
          @dia += 1
  
        when "Oberon"
          puts "\n Oberon orbita Urano a uma distância de aproximadamente 583 500 quilômetros,"
          puts "sendo o satélite mais afastado do planeta entre os cinco principais. "
          puts "Sua órbita tem uma pequena excentricidade, sendo praticamente circular,"
          puts "e é pouco inclinada em relação ao equador de Urano"
  
          ganhos = rand(30..180)
          puts "\n seus ganhos hoje foram #{ganhos}"
          sleep(1)
          @creditos += ganhos
          @deadline -= 1
          @dia += 1
  
        when "Nereida"
          puts "\n Nereida foi a segunda lua descoberta na órbita de Netuno, e este é um satélite natural de extremos."
          puts "Sua distância em relação ao planeta varia entre 1,4 milhão e 9,7 milhões de quilômetros,"
          puts "uma característica típica de satélites capturados pela imensa gravidade do planeta."
  
          ganhos = rand(20..190)
          puts "\n seus ganhos hoje foram #{ganhos}"
          sleep(1)
          @creditos += ganhos
          @deadline -= 1
          @dia += 1
  
        when "Help"
          Sistema.new.help_game
  
        when "Salvar"
          Sistema.new.salvar_jogo(@dia, @deadline, @cota, @creditos)
  
        when "Sair"
          break
  
        else
          puts "\e[2J\e[f"
          puts "Comando incorreto, por favor escolha uma das luas listadas: "     
        end
  
        if @creditos >= @cota
          sleep(1)
          puts "\n Parabéns! Você atingiu a cota."
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
  
    def salvar_jogo(dia, deadline, cota, creditos)
      # Mecânica de salvamento
      dados_do_save = {
        'dia' => dia,
        'deadline' => deadline,
        'cota' => cota,
        'creditos' => creditos
      }

      caminho_arquivo = './Save_File/save.json'
    
      File.open(caminho_arquivo, 'w') do |arquivo|
        arquivo.puts JSON.dump(dados_do_save)
      end
  
      sleep(2)
      print "\e[2J\e[f"
      puts "\n Jogo salvo com Sucesso"
      sleep(1)
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
      print "\e[2J\e[f"
      sleep(2)
      puts "\n Guia de comandos dentro do jogo:"
      sleep(2)
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
end

CosmicCoder::JogoDigitacao.new.iniciar
