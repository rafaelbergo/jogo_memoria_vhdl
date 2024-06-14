library ieee;
use ieee.std_logic_1164.all;

entity testa_bits is
    port (
        a7 : in std_logic;
        a6 : in std_logic;
        a5 : in std_logic;
        a4 : in std_logic;
        b7 : in std_logic;
        b6 : in std_logic;
        b5 : in std_logic;
        b4 : in std_logic;
        enable : in std_logic;
        reset : in std_logic;
        clk : in std_logic;
        saida : out std_logic;
        controle : out std_logic
    );
end testa_bits;

architecture Behavioral of testa_bits is
    signal reg_a7, reg_a6, reg_a5, reg_a4 : std_logic;
    signal reg_b7, reg_b6, reg_b5, reg_b4 : std_logic;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- Resetar os registradores
            reg_a7 <= '0';
            reg_a6 <= '0';
            reg_a5 <= '0';
            reg_a4 <= '0';
            reg_b7 <= '0';
            reg_b6 <= '0';
            reg_b5 <= '0';
            reg_b4 <= '0';
            controle <= '0';
            saida <= '0';
        elsif rising_edge(clk) then
            if enable = '1' then
                reg_a7 <= a7;
                reg_a6 <= a6;
                reg_a5 <= a5;
                reg_a4 <= a4;
                reg_b7 <= b7;
                reg_b6 <= b6;
                reg_b5 <= b5;
                reg_b4 <= b4;

                controle <= '1';  -- Ativa controle quando enable está ativo
                
                if (reg_a7 = reg_b7) and 
                   (reg_a6 = reg_b6) and
                   (reg_a5 = reg_b5) and
                   (reg_a4 = reg_b4) then
                    saida <= '1';  -- Ativa saida quando todos os bits são iguais
                else
                    saida <= '0';  -- Desativa saida quando pelo menos um bit é diferente
                end if;
            else
                controle <= '0';  -- Desativa controle quando enable não está ativo
                saida <= '0';  -- Desativa saida quando enable não está ativo
            end if;
        end if;
    end process;
end Behavioral;
