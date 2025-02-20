# Jogo da Memória com Dígitos Hexadecimais Aleatórios

## Introdução

Este projeto é um jogo da memória com dígitos hexadecimais gerados aleatoriamente a cada partida. Ele integra diversos componentes aprendidos durante a disciplina de Circuitos Digitais, como memórias, piso, detector de sequência, contadores, multiplexadores, entre outros.

## Como Jogar

1. O jogo começa gerando sequências aleatórias de dígitos hexadecimais.
2. Para iniciar, o jogador deve acionar a chave SW9 para parar a sequência, tendo um tempo pré-definido para memorizar os dígitos.
3. Após o tempo de memorização, o jogador deve inserir os 4 bits referentes ao primeiro dígito hexadecimal gerado e usar o push button 1 para deslocar os bits e inserir os próximos dígitos.
4. Com a chave SW8, o jogador pode verificar se os dígitos inseridos correspondem aos gerados anteriormente. Se forem iguais, a pontuação aumentará em 1.
5. A pontuação é exibida em binário em 5 LEDs, de LED0 a LED4.
6. A dificuldade do jogo pode ser ajustada com a chave SW7, onde a chave ativa diminui o tempo de memorização, tornando o jogo mais difícil.

## Componentes Utilizados

- **Memórias**: Três memórias de 256x8 usadas para gerar a sequência de dígitos.
- **Clock e Contador**: Um clock alto e um contador de 8 bits para garantir a aleatoriedade dos bits gerados.
- **Pipo**: Armazena os valores gerados para comparação futura.
- **Mux 8x4**: Alterna entre os displays para inserção dos bits.
- **Seletor de Clock**: Modifica a dificuldade alterando a velocidade do contador.
- **Pisos**: Permitem a inserção e deslocamento dos bits referentes a cada dígito.
- **Verifica_bits**: Compara a sequência inserida com a gerada e atualiza a pontuação.

## Ferramentas utilizadas


  Quartus Prime - 18.1.0.625

  FPGA DE10-Lite Altera - 10M50DAF484C7G

## Fotos
![20250219_131803](https://github.com/user-attachments/assets/97a9d1f6-dbe7-4adf-80a7-dbc380943b93)
