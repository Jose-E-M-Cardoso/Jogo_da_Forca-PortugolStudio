programa
{
	inclua biblioteca Matematica --> mat
	//Adicionando bibiotecas
	inclua biblioteca Sons --> som    
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> ut
	
     // declarando variavel global
	cadeia palavra_sorteada[300], vetor_palavra[50] 
	inteiro tamanho_palavras_da_linha[300], posicao_dica = 1, quatindade_de_dicas_da_palavra = 0
	logico mostrar_infos_aluno = verdadeiro
	caracter resp_dica = 'n'

	// Ao iniciar a funcao inicio sera a primeira a rodas
	funcao inicio() {
	
      posicao_dica = 1

      cadeia start = ""
               se (mostrar_infos_aluno == verdadeiro) {
			escreva("--------------- Integrantes -----------------\n")
			escreva("\nGleyce Mayse de Oliveira Santos          RA: 1680482212034 \n")
			escreva("Jefferson  Wlisses Fernandes da Silva    RA: 1680482212002 \n")
			escreva("José Eduardo Machado Cardoso             RA: 1680482212035 \n")
			escreva("---------------------------------------------\n\n")
			escreva("========== Partes desenvolvidas =============\n")
          	escreva("\nJOGO [X]\nDICAS[X]\n")
          	escreva("=============================================\n")

          	escreva("\nAperte ENTER para iniciar o jogo\n")
          	
          	leia(start)
               }
          limpa()
		

		/*declarando as funcoes relacionadas ao tema
		A variavel tema verifica se o algum tema sugerido foi escolhido  
		*/
		cadeia tema = "Selecione um tema valido"  

		//looping que verifica se algum tema foi escolhido ou nao
		enquanto(tema == "Selecione um tema valido") {
			// se o tema nao foi escolhido, ele entra no loop e chama a funcao para selecionar um tema valido
			tema = decisao_tema()


               // entrara nessa condicao caso a pessoa digite um numero invalido
			se(tema == "Selecione um tema valido") {
				escreva("O tema selecionado e invalido, selecione uma opcao valido!\n")
			}

		} // fim do enquanto


          /*Chamo a funcao que sorteia a palavra. O parametro tema vai sortear o tema que foi escolhido pelo jogador
           e o parametro linhas vai indicar a quantidade de linhas de acordo com o tema selecionado.
          */
		sorteia_palavra(tema)
		limpa()
		
		//A resposta da rodada passa a ficar em caixa alta
		palavra_sorteada[0] = tx.caixa_alta(palavra_sorteada[0])
		//escreva(palavra_sorteada[0]+"\n")


		//Chama a funcao quebra_palavra e passa como paramento a resposta da rodada
		quebra_palavra(palavra_sorteada[0])
		
		/*Chama a funcao forca e passa como parametro o vetor_palavra (que e a palavra da rodada desmenbrada, onde
		 cada letra da palavra esta em uma posicao dentro do vetor)
		*/
		forca(vetor_palavra, tx.numero_caracteres(palavra_sorteada[0]))
		

	}
	funcao musica_acertou()
	{
		inteiro refSom
		cadeia res
		
		refSom = som.carregar_som("Acertou.mp3")
		
		som.reproduzir_som(refSom, falso)
	}
	funcao musica_errou()
	{
		inteiro refSom
		cadeia res
		
		refSom = som.carregar_som("Errou.mp3")
		
		som.reproduzir_som(refSom, falso)
	}
	funcao musica_vencedor()
	{
		inteiro refSom
		cadeia res
		
		refSom = som.carregar_som("Vencedor.mp3")
		
		som.reproduzir_som(refSom, falso)
	}
	funcao musica_game_over()
	{
		inteiro refSom
		cadeia res
		
		refSom = som.carregar_som("Game_Over.mp3")
		
		som.reproduzir_som(refSom, falso)
	}
	funcao desenha_trofeu () {
         
          limpa()
          ut.aguarde(100)
          escreva("Você acertou a palavra: ",palavra_sorteada[0], "\n")
          ut.aguarde(100) 
     	escreva("========================================\n")
     	ut.aguarde(100)
     	escreva("             ___________\n")
     	ut.aguarde(100)
     	escreva("            '._==_==_=_.'\n")
     	ut.aguarde(100)
     	escreva("            .-\\:      /-.\n")
     	ut.aguarde(100)
     	escreva("           | (|:.     |) |\n")
     	ut.aguarde(100)
     	escreva("            '-|:.     |-'\n")
     	ut.aguarde(100)
     	escreva("              \\::.    /\n")
     	ut.aguarde(100)
     	escreva("               '::. .'\n")
     	ut.aguarde(100)
     	escreva("                 ) (\n")
     	ut.aguarde(100)
     	escreva("               _.' '._\n")
     	ut.aguarde(100)
     	escreva("               ''''''''\n")
     	ut.aguarde(100)
     	escreva("              VOCÊ GANHOU                   \n")
     	ut.aguarde(100)
     	escreva("========================================\n\n")
     	ut.aguarde(100)
          
         
     }
	funcao desenha_boneco(inteiro erros){
		
		se (erros == 6) {
			escreva("\n--------                   \n|      |                   \n|                         \n|                       \n|                         \n|                        \n-")
		} 
		se (erros == 5) {
			escreva("--------                   \n|      |                   \n|      O                   \n|                       \n|      \n|     \n-")
		}
		se (erros == 4) {
			escreva("--------                   \n|      |                   \n|      O                   \n|      |                   \n|      |\n|     \n-")
		}
		se (erros == 3) {
			escreva("--------                   \n|      |                   \n|      O                   \n|     \\|                   \n|      |                   \n|                        \n-")
		}
		se (erros == 2) {
			escreva("--------                   \n|      |                   \n|      O                   \n|     \\|/                  \n|      |                   \n|                        \n-")
		}
		se (erros == 1) {
			escreva("--------                   \n|      |                   \n|      O                   \n|     \\|/                   \n|      |                   \n|     /                    \n-")
		}
		se (erros == 0) {
			escreva("--------                   \n|      |                   \n|      O                   \n|     \\|/                   \n|      |                   \n|     / \\                    \n-")
		}
		
	}
	funcao quebra_palavra(cadeia palavra) {
		// Funcao que vai tranformar uma cadeia em vetor
		//Declarando as variaveis 
		inteiro cont = 0, tamanho_da_palavra = tx.numero_caracteres(palavra)
		cadeia letra

          //Looping que vai extrair cada letra da "cadeia palavra" e vai adicionar ao vetor
		enquanto (cont < tamanho_da_palavra) {
               // a variavel letra recebe cada letra extraida da sorteada
			letra = tx.extrair_subtexto(palavra, cont, cont+1)
			// e depois disso as letras, que ja foram separadas sao adicionadas ao vetor
			vetor_palavra[cont] = letra
			cont++ // continua rodando o loop ate chegar a ultima letra da palavra sorteada
		}

	}
	funcao sorteia_palavra(cadeia caminho_arquivo)
	{   
	    // Funcao que vai sortear uma palavra do arquivo txt
         // paramentos: arquivo para leitura
         //declaraçao de variaveis 
	    inteiro linha_sorteada = 0, arquivo_linhas = arq.abrir_arquivo(caminho_arquivo, arq.MODO_LEITURA) 
	    inteiro posicao_das_linhas_p_na_matriz = -1, quantidade_colunas = 0, quantidade_de_p_na_matriz = 0
	    cadeia linha_matriz = "", palavra = "", matriz[300][60]
	    inteiro quantidade_de_colunas_da_linhas[300], coluna = 0

         //enquanto nao for o fim do arquivo o loop continuara rodando 
	    enquanto (nao arq.fim_arquivo(arquivo_linhas))
	    {
		    	// variavel recebe a linha do arquivo txt
		    	linha_matriz = arq.ler_linha(arquivo_linhas)
		    	se (tx.numero_caracteres(linha_matriz) > 0) {
		    		/*verifica se a linha atual é a P: "Palavra" e add a palavra como primeiro elemento 
		    		da linha da matriz (primeira coluna)*/
		    		se(tx.extrair_subtexto(linha_matriz, 0, 1) == "P") {
		    			posicao_das_linhas_p_na_matriz++ // comeca com menos um e vai pra zero, pegando a prmeira palavra
		    			quantidade_de_p_na_matriz++ // quantidade de P: que tem dentro do arquivo txt
		    			quantidade_de_colunas_da_linhas[posicao_das_linhas_p_na_matriz] = 1 // passa a receber o valor da primeira dica
		    			quantidade_colunas = 0
		    			palavra = tx.extrair_subtexto(linha_matriz, 2, tx.numero_caracteres(linha_matriz))
		    			matriz[posicao_das_linhas_p_na_matriz][quantidade_colunas] = palavra
		    		}senao{
		    			quantidade_de_colunas_da_linhas[posicao_das_linhas_p_na_matriz] = quantidade_de_colunas_da_linhas[posicao_das_linhas_p_na_matriz] + 1
		    			quantidade_colunas++
		    			palavra = tx.extrair_subtexto(linha_matriz, 2, tx.numero_caracteres(linha_matriz))
		    			matriz[posicao_das_linhas_p_na_matriz][quantidade_colunas] = palavra
		    		}
		    	}
	    	}

	    linha_sorteada = ut.sorteia(0, quantidade_de_p_na_matriz)
	    // Variável receberá o valor sorteado de acorordo com o número de linhas do arquivo

	    se(linha_sorteada != 0) {
	    	linha_sorteada--
	    }

	    quatindade_de_dicas_da_palavra = 9
	  
	    enquanto (coluna != quantidade_de_colunas_da_linhas[linha_sorteada]) {
	    	  palavra_sorteada[coluna] = matriz[linha_sorteada][coluna]
	    	  coluna ++
	    }
	    arq.fechar_arquivo(arquivo_linhas)
	}
	funcao cadeia decisao_tema() {
		
		inteiro tema
	
		escreva("\nTemas do jogo: \n")
		escreva("\n1 – Tecnologia")
		escreva("\n2 – Frutas")
		escreva("\n3 – Países")
		escreva("\n4 - Aleatório")
		
		escreva("\n\nQual tema deseja jogar?: ")
		leia(tema)
			
	
		escolha(tema) {
			caso 1:
				retorne "tecnologia.txt"
			caso 2:
				retorne "frutas.txt"
			caso 3:
				retorne "paises.txt"
			caso 4: 
			     retorne "jogo_tema_misturados.txt"
				
		}
		retorne "Selecione um tema valido"
	}
	funcao forca(cadeia palavra[], inteiro tamanho_palavra) {

		inteiro acertos = 0, erros = 0
		cadeia formacao[50], letra, letras_erradas[6], jogar_novamente, dica
		logico acertou, repetiu, repetiu_erro

		acertos = tamanho_palavra
		erros = 6
				
		para(inteiro posicao = 0; posicao < tamanho_palavra; posicao++) {
			formacao[posicao] = "_"
		}

		para(inteiro posicao = 0; posicao < tamanho_palavra; posicao++) {
				se(" " == palavra[posicao]) {
				    formacao[posicao] = " "
				    acertos--
				}
		}

		enquanto (acertos > 0 e erros > 0) {

			mostrar_informacoes(erros,tamanho_palavra,formacao,letras_erradas)

			leia(letra)
			letra = tx.caixa_alta(letra)
		
			acertou = falso
			repetiu = falso
			repetiu_erro = falso

			para(inteiro posicao = 0; posicao < tamanho_palavra; posicao++) {
				se(letra == palavra[posicao]) {
					se(formacao[posicao] == letra) {
						repetiu = verdadeiro
					}
					senao {
						acertou = verdadeiro
						formacao[posicao] = letra
						acertos--
					}
				}
			}
			para (inteiro posicao = 0; posicao < ut.numero_elementos(letras_erradas); posicao++) {
				se(letra == letras_erradas[posicao]) {
					repetiu = verdadeiro
				}
			}
				
			se(repetiu == verdadeiro) {
				limpa()
				escreva("Você já escolheu essa letra!\n")
			}
			senao se(acertou == verdadeiro) {
				limpa()
				escreva("Você acertou a letra!\n")
				musica_acertou()
			}
			senao {
				limpa()
				letras_erradas[6-erros] = letra
				erros--
				escreva("Você errou a letra!\n")
				musica_errou()
			}
				
			se(acertos != 0 e quatindade_de_dicas_da_palavra != 1) {
				mostrar_informacoes(erros,tamanho_palavra,formacao,letras_erradas)
				escreva("\nQuer mais uma dica?[S/N]: ")
				leia(resp_dica)

				se(resp_dica == 'S' ou resp_dica == 's') {
					posicao_dica++
					quatindade_de_dicas_da_palavra--
				}
				senao se (resp_dica == 'n' ou resp_dica == 'N') {
					escreva("")
				}
				senao {
					escreva("Digite 'S' se quiser uma dica e 'N' se não quiser!")
					escreva("\nQuer mais uma dica?[S/N]: ")						
					leia(resp_dica)
				}
				limpa()
			}
			senao {
				escreva("Suas dicas acabaram!\n")
			}
	
		}

		se(acertos == 0) {
			musica_vencedor()
			escreva( "Você descobriu a palavra : ")
			para(inteiro posicao = 0; posicao < tamanho_palavra; posicao++) {
				  escreva(formacao[posicao])	
			}	
				  
			  desenha_trofeu()
			  escreva("Deseja jogar novamente?[S/N]")
			  leia(jogar_novamente)	
				  	
			  se (tx.caixa_alta(jogar_novamente) == "S") {
			  	   limpa()
			  	   mostrar_infos_aluno=falso
			  	   inicio() 
			  	   decisao_tema()
			  }
		}
		se(erros == 0) {
			musica_game_over()
			mostrar_informacoes(erros,tamanho_palavra,formacao,letras_erradas)
			escreva("\nVocê não descobriu a palavra!\n\n")
			escreva("Deseja jogar novamente?[S/N]")
			 leia(jogar_novamente)	
				  	
			se (tx.caixa_alta(jogar_novamente) == "S") {
			  	 limpa()
			  	 mostrar_infos_aluno=falso
			  	 inicio() 
			  	 decisao_tema()
			 }
		}
	}
	funcao mostrar_informacoes(inteiro erros, inteiro tamanho_palavra, cadeia formacao[], cadeia letras_erradas[]) {
		/* Essa função mostrará tudo que é necessário que o usuário veja para jogar.
		 * Sempre que uma letra for digitada, esta função rodará
		 */
			
			cadeia dica
			//Aqui é mostrado quantas tentativas e dicas o jogador possui
			escreva("Você tem ", erros, " chances e ", quatindade_de_dicas_da_palavra-1, " dicas.\n\n") 
			// Esse loop inclui a dica do vetor, de acordo com a sua posição, na variável 'dica' e a imprime em seguida
			para(inteiro cont = 1; cont <= posicao_dica; cont ++){
				dica = palavra_sorteada[cont]
				escreva("Dica: ",dica,"\n")
			}
			escreva("\nEscreva uma letra para a palavra: \n")	
			/* Essa condicional verifica se o jogador já realizou alguma tentativa.
			 * Se sim, erros passa a ser diferente de 6 e então começa a contar as letras erradas
			 */
			se(erros != 6) {
				escreva("\nVocê errou essas letras: \n")
				para(inteiro cont_erros = 0; cont_erros < ut.numero_elementos(letras_erradas); cont_erros++) {
					escreva(letras_erradas[cont_erros])
				}
				escreva("\n")
			}
			// De acordo com os erros a função desenha o boneco		
			desenha_boneco(erros)
			// Este loop imprime a formação da palavra de acordo com as letras acertadas
			para(inteiro posicao = 0; posicao < tamanho_palavra; posicao++) {
				ut.aguarde(70)
				escreva(formacao[posicao])
				ut.aguarde(70)
			}

			escreva("\n")	
				
	}
	
}
	
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1097; 
 * @DOBRAMENTO-CODIGO = [78, 87, 96, 105, 114, 149, 174, 190, 239, 266, 390];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz;
 */