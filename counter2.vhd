library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter8bit_2 is
    port (
        cout  : out std_logic_vector (7 downto 0); -- Output of the counter
        clk   : in  std_logic;                     -- Input clock
        reset : in  std_logic                      -- Input reset
    );
end entity;

architecture rtl of counter8bit_2 is
    signal count : std_logic_vector (7 downto 0);
    constant valor_inicial : std_logic_vector(7 downto 0) := "00010100"; -- Define 00010100 como o valor inicial do contador
begin
	 process (clk, reset)
	 begin
        if reset = '1' then
            count <= valor_inicial; -- Carrega o valor inicial
        elsif rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;

    cout <= count;
end architecture;