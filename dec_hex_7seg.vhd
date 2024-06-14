Library ieee;
use ieee.std_logic_1164.all;

entity dec_hex_7seg is
  port (
    M, N, O, P: in std_logic;
    a, b, c, d, e, f, g: out std_logic
  );
end dec_hex_7seg;


architecture arc_dec_hex_7seg of dec_hex_7seg is
  begin
    a <= not(((M and not P) or (not N and not P) or (not M and O) or (N and O) or (not M and N and P) or (M and not N and not O)));
	 b <= not(((not M and not N) or (not N and not P) or (not M and O and P) or (M and not O and P) or (not M and not O and not P)));
	 c <= not(((not M and N) or (M and not N) or (not O and P) or (not M and not O) or (not M and P)));
	 d <= not(((M and not O) or (N and not O and P) or (not M and not N and not P) or (not N and O and P) or (N and O and not P)));
	 e <= not(((O and not P) or (M and N) or (M and O) or (not N and not P)));
	 f <= not(((M and O) or (M and not N) or (not O and not P) or (not M and N and not O) or (N and not P)));
	 g <= not(((M and P) or (O and not P) or (M and not N) or (not M and N and not O) or (not N and O)));
  end arc_dec_hex_7seg;