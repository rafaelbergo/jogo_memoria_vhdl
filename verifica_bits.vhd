library ieee;
use ieee.std_logic_1164.all;

entity verifica_bits is
    port (
        vetor_a : in std_logic_vector(23 downto 0);
        vetor_b : in std_logic_vector(23 downto 0);
        enable : in std_logic; -- Define quando a verificacao vai ser ativa
        saida : out std_logic;
        erro : out std_logic
    );
end verifica_bits;

architecture Behavioral of verifica_bits is
begin
    process(vetor_a, vetor_b, enable)
    begin
        if enable = '1' then
            if vetor_a = vetor_b then
                saida <= '1'; -- Se os dois vetores sao iguais a saida vai ser 1
                erro <= '0';  
            else
                saida <= '0';
                erro <= '1'; -- Se algum bit for diferente a saida erro vai ser 1
            end if;
        else
            saida <= '0'; -- Se enable for 0 todas as saidas vao ser 0
            erro <= '0'; 
        end if;
    end process;
end Behavioral;