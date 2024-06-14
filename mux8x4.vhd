Library ieee;
use ieee.std_logic_1164.all;

entity mux_8x4 is
  port (
    i00, i01, i02, i03: in std_logic; -- 8 bits de entrada onde o ativa define quais bits vao ser a saida
	 i10, i11, i12, i13: in std_logic;	
	 ativa: in std_logic;	
	 o3, o2, o1, o0: out std_logic
  );
end mux_8x4;

architecture arch of mux_8x4 is
begin
	process(i00, i01, i02, i03, i10, i11, i12, i13, ativa)
	begin
		if ativa = '1' then -- Se o ativa e 1 a saida vai ser i0, caso contrario a saida vai ser i1
			o3 <= i03;
			o2 <= i02;
			o1 <= i01;
			o0 <= i00;
		else 
			o3 <= i13;
			o2 <= i12;
			o1 <= i11;
			o0 <= i10;
		end if;
	end process;
end arch;