library ieee;
use ieee.std_logic_1164.all;
 
entity pipo is
 port(
 clk : in std_logic; -- O clock funciona como um enable utilizando um and2
 q: in std_logic_vector(23 downto 0); -- Vetor de entrada
 o: out std_logic_vector(23 downto 0) -- Vetor de saida
 );
end pipo;
 
architecture arch of pipo is
 
begin
 
 process (clk)
 begin
 if (CLK'event and CLK='1') then
 o <= q; -- Atribui o valor da entrada(q) a saida(o)
 end if;
 end process;
 
end arch;