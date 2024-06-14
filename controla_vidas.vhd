Library ieee; 
use ieee.std_logic_1164.all; 

ENTITY controla_vidas IS
   PORT(
      clk          : IN   STD_LOGIC;
      verifica_bits: IN   STD_LOGIC;
      q3, q2, q1, q0 : OUT  STD_LOGIC;
      rst_tudo     : OUT  STD_LOGIC);
END controla_vidas;

ARCHITECTURE funcionamento OF controla_vidas IS
   TYPE STATE_TYPE IS (s0, s1, s2, s3, s4);
   SIGNAL estado   : STATE_TYPE := s0; -- Estado inicial
   SIGNAL verifica_bits_sync1, verifica_bits_sync2 : STD_LOGIC;
   SIGNAL verifica_bits_r : STD_LOGIC;
   SIGNAL enable   : STD_LOGIC;
   
BEGIN
   -- Sincroniza o sinal verifica_bits ao clock da FPGA para evitar problemas de setup/hold
   PROCESS (clk)
   BEGIN
      IF (rising_edge(clk)) THEN
         verifica_bits_sync1 <= verifica_bits;
         verifica_bits_sync2 <= verifica_bits_sync1;
         verifica_bits_r <= verifica_bits_sync2;
      END IF;
   END PROCESS;

   -- Detecta borda de subida no verifica_bits e gera um pulso de enable de um ciclo de clock
   enable <= verifica_bits_sync2 AND NOT verifica_bits_r;

   -- Máquina de estados
   PROCESS (clk)
   BEGIN  
      IF (rising_edge(clk)) THEN
         IF enable = '1' THEN
            CASE estado IS
               WHEN s0 => estado <= s1;
               WHEN s1 => estado <= s2;
               WHEN s2 => estado <= s3;
               WHEN s3 => estado <= s4;
               WHEN s4 => estado <= s0;            
            END CASE;
         END IF;
      END IF;
   END PROCESS;
   
   -- Saídas baseadas no estado
   PROCESS (estado)
   BEGIN
      CASE estado IS
         WHEN s0 =>    -- 4 vidas
            q3 <= '1';
            q2 <= '1';
            q1 <= '1';
            q0 <= '1';
            rst_tudo <= '0';
         WHEN s1 =>    -- 3 vidas
            q3 <= '0';
            q2 <= '1';
            q1 <= '1';
            q0 <= '1';
            rst_tudo <= '0';
         WHEN s2 =>    -- 2 vidas
            q3 <= '0';
            q2 <= '0';
            q1 <= '1';
            q0 <= '1';
            rst_tudo <= '0';
         WHEN s3 =>    -- 1 vida
            q3 <= '0';
            q2 <= '0';
            q1 <= '0';
            q0 <= '1'; 
            rst_tudo <= '0';    
         WHEN s4 =>    -- 0 vida
            q3 <= '0';
            q2 <= '0';
            q1 <= '0';
            q0 <= '0';
            rst_tudo <= '1';
      END CASE;
   END PROCESS;
   
END funcionamento;
