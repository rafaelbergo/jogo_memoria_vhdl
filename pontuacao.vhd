library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pontuacao is
    port (
        clk    : in  std_logic;
        acerto : in  std_logic;
        reset  : in  std_logic;
        count  : out std_logic_vector(4 downto 0)
    );
end pontuacao;

architecture behavior of pontuacao is
    signal counter : std_logic_vector(4 downto 0) := "00000";
    signal counter_d : std_logic_vector(4 downto 0);
    signal acerto1, acerto2 : std_logic;
    signal acerto_detectado : std_logic;
begin

    process(clk)
    begin
        if rising_edge(clk) then -- Vai sincronizar o acerto com o clock
            acerto1 <= acerto;
            acerto2 <= acerto1;
            acerto_detectado <= acerto1 and not acerto2;
        end if;
    end process;

    -- Incremento do contador na borda de subida de acerto
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then -- Reseta o contador se reset for 1
                counter <= "00000";
            elsif acerto_detectado = '1' then
                counter <= counter + 1; -- Caso reset !=1 incrementa o contador
            end if;
        end if;
    end process;

    -- Armazena o valor do contador utilizando um flip-flop D
    process(clk)
    begin
        if rising_edge(clk) then -- Salva o valor do contador baseado no clock
            counter_d <= counter;
        end if;
    end process;

    count <= counter_d; -- Saida do contador

end behavior;