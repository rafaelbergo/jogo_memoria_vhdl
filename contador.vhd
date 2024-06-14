library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador is
    port (
        clock : in std_logic;
        reset_contador : in std_logic;
        desloca : out std_logic; -- Saida para ativar o pipo para deslocar os bits
        pause : out std_logic; -- Saida para pausar o contador
		  ativa_mux : out std_logic; -- Saida para alternar os displays entre sequencia gerada e piso
        led0 : out std_logic;
        led1 : out std_logic;
        led2 : out std_logic;
        led3 : out std_logic
    );
end contador;

architecture Behavioral of contador is
    signal contador : unsigned(3 downto 0) := (others => '0'); -- Cria um sinal para ser o contador
    signal contador_habilitado : std_logic := '1'; -- Sinal para ativar ou desativar o contador
    signal pause_temp : std_logic := '0'; -- Sinal para controlar a pausa
begin
    process(clock, reset_contador)
    begin
        if reset_contador = '1' then -- Define o que acontece quando o reset e ativo
            contador <= (others => '0');
            desloca <= '0';
            pause_temp <= '0';
				ativa_mux <= '0';
            contador_habilitado <= '1'; -- Habilita o contador quando resetar
        elsif rising_edge(clock) then
            if contador_habilitado = '1' then
                if contador = "1001" then -- Quando o contador chegar em 9 ativa os sinais desloca e ativa_mux e pausa o contador
                    desloca <= '1';
						  ativa_mux <= '1';
                    contador <= (others => '0');
                    pause_temp <= '1'; 
                else -- Caso contrario incrementa o contador e nao ativa nada
                    desloca <= '0';
						  ativa_mux <= '0';
                    contador <= contador + 1; 
                    pause_temp <= '0';
                end if;
            end if;
        end if;
    end process;

    -- Atribui o valor do contador aos leds
    led0 <= contador(0);
    led1 <= contador(1);
    led2 <= contador(2);
    led3 <= contador(3);

    -- Atribui o valor de pausa apenas quando o contador e 1001 
    pause <= pause_temp;
end Behavioral;