library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end;

architecture alu_arq of alu_tb is

  component alu is
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
  end component;
  constant N_tb : natural := 4;

  -- Senales de prueba
  signal clk : std_logic := '0';
  signal a_tb : std_logic_vector(N_tb - 1 downto 0) := std_logic_vector(to_unsigned(0, N_tb));
  signal b_tb : std_logic_vector(N_tb - 1 downto 0) := std_logic_vector(to_unsigned(0, N_tb));
  signal ci_tb : std_logic := '0';
  signal opcode_tb : std_logic_vector(3 downto 0) := "0000";
  signal s_tb : std_logic_vector(N_tb - 1 downto 0);
  signal co_tb : std_logic;

begin
  clk <= not clk after 10 ns;
  a_tb <= std_logic_vector(unsigned(a_tb) + to_unsigned(1, N_tb)) after 20 ns;
  b_tb <= std_logic_vector(unsigned(b_tb) + to_unsigned(1, N_tb)) after 320 ns;

  -- a_tb <= std_logic_vector(to_unsigned(8,N_tb)) after 40 ns, std_logic_vector(to_unsigned(3,N_tb)) after 100 ns , std_logic_vector(to_unsigned(6,N_tb)) after 160 ns;
  -- b_tb <= std_logic_vector(to_unsigned(3,N_tb)) after 40 ns, std_logic_vector(to_unsigned(1,N_tb)) after 100 ns , std_logic_vector(to_unsigned(1,N_tb)) after 160 ns;
  ci_tb <= not ci_tb after 5120 ns;
  opcode_tb <= "0111";
  DUT : alu
  generic map(
    N => N_tb
  )
  port map(
    clk => clk,
    a_i => a_tb,
    b_i => b_tb,
    ci_i => ci_tb,
    opcode_i => opcode_tb,
    s_o => s_tb,
    co_o => co_tb
  );
end architecture;