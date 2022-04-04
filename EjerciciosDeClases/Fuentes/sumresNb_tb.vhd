library IEEE;
use IEEE.std_logic_1164.all;

entity sumresNb_tb is
end;

architecture sumresNb_tb_arq of sumresNb_tb is

  -- Declaracion de componente
  component sumresNb is
    generic (
      N : natural := 4
    );
    port (
      a_i : in std_logic_vector(N - 1 downto 0);
      b_i : in std_logic_vector(N - 1 downto 0);
      ci_i : in std_logic;
      sr_i : in std_logic;
      s_o : out std_logic_vector(N - 1 downto 0);
      co_o : out std_logic
    );
  end component;

  constant N_tb : natural := 4;

  -- Senales de prueba
  signal a_tb : std_logic_vector(N_tb - 1 downto 0) := "0000";
  signal b_tb : std_logic_vector(N_tb - 1 downto 0) := "0000";
  signal ci_tb : std_logic := '0';
  signal sri_tb : std_logic := '0';
  signal s_tb : std_logic_vector(N_tb - 1 downto 0);
  signal co_tb : std_logic;

begin

  a_tb(0) <= not a_tb(0) after 10 ns;
  b_tb(0) <= not b_tb(0) after 20 ns;
  a_tb(1) <= not a_tb(1) after 40 ns;
  b_tb(1) <= not b_tb(1) after 80 ns;
  a_tb(2) <= not a_tb(2) after 160 ns;
  b_tb(2) <= not b_tb(2) after 320 ns;
  a_tb(3) <= not a_tb(3) after 640 ns;
  b_tb(3) <= not b_tb(3) after 1280 ns;
  ci_tb <= not ci_tb after 2560 ns;
  sri_tb <= not sri_tb after 5120 ns;
  -- Instanciacion del componente a probar
  DUT : sumresNb
  generic map(
    N => N_tb
  )
  port map(
    a_i => a_tb,
    b_i => b_tb,
    ci_i => ci_tb,
    s_o => s_tb,
    sr_i => sri_tb,
    co_o => co_tb
  );

end;