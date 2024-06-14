library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter8bit is
    port (
        cout   : out std_logic_vector (7 downto 0); -- Output of the counter
        clk    : in  std_logic;                     -- Input clock
        reset  : in  std_logic                      -- Input reset
    );
end entity;

architecture rtl of counter8bit is
    signal count : std_logic_vector (7 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;

    cout <= count;
end architecture;