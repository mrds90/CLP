library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
  generic (
    N : natural := 8
  );
  port (
    clk : in std_logic;
    a_i : in std_logic_vector(N - 1 downto 0);
    b_i : in std_logic_vector(N - 1 downto 0);
    ci_i : in std_logic;
    opcode_i : in std_logic_vector(3 downto 0);
    s_o : out std_logic_vector(N - 1 downto 0);
    co_o : out std_logic
  );
end;

architecture alu_arq of alu is
begin
  process (clk, opcode_i)
    variable s_aux : std_logic_vector(N + 1 downto 0);
  begin
    if rising_edge(clk) then
      case opcode_i is
        when "0000" => --suma
          s_aux := std_logic_vector(signed('0' & a_i & ci_i) + signed('0' & b_i & '1'));
          s_o <= s_aux(N downto 1);
          co_o <= s_aux(N + 1);
        when "0001" => --resta
          s_aux := std_logic_vector(signed('0' & a_i & '0') - signed('0' & b_i & ci_i));
          s_o <= s_aux(N downto 1);
          co_o <= s_aux(N + 1);
        when "0010" => -- mult
          s_o <= std_logic_vector(unsigned(a_i(((N - 1)/2) downto 0)) * unsigned(b_i(((N - 1)/2) downto 0)));
          co_o <= '0';
        when "0011" => -- desplazamiento izquierda
          s_aux := std_logic_vector(shift_left(unsigned('0' & a_i & ci_i), to_integer(unsigned(b_i))));
          s_o <= s_aux(N downto 1);
          co_o <= s_aux(N + 1);
        when "0100" => -- desplazamiento derecha
          s_aux := std_logic_vector(shift_right(unsigned(ci_i & a_i & '0'), to_integer(unsigned(b_i))));
          s_o <= s_aux(N downto 1);
          co_o <= s_aux(0);
        when "0101" => -- desplazamiento izquierda signada
          s_aux := std_logic_vector(shift_left(signed('0' & a_i & ci_i), to_integer(unsigned(b_i))));
          s_o <= s_aux(N downto 1);
          co_o <= s_aux(N + 1);
        when "0110" => -- desplazamiento derecha signada
          s_aux := std_logic_vector(shift_right(signed(ci_i & a_i & '0'), to_integer(unsigned(b_i))));
          s_o <= s_aux(N downto 1);
          co_o <= s_aux(0);
        when "0111" => -- AND
          s_o <= a_i and b_i;
          co_o <= '0';
        when "1000" => -- OR
          s_o <= a_i or b_i;
          co_o <= '0';
        when "1001" => -- XOR
          s_o <= a_i xor b_i;
          co_o <= '0';
        when "1010" => -- NAND
          s_o <= a_i nand b_i;
          co_o <= '0';
        when "1011" => -- NOR
          s_o <= a_i nor b_i;
          co_o <= '0';
        when "1100" => -- NOT XOR
          s_o <= a_i xnor b_i;
          co_o <= '0';
        when "1101" => -- NOT
          s_o <= not a_i;
          co_o <= '0';
        when others =>
          co_o <= '0';
          s_o <= std_logic_vector(to_unsigned(0, N));
      end case;
    end if;
  end process;
end architecture;