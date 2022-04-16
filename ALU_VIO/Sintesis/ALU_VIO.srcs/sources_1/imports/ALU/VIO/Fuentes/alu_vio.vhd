library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_vio is
  port(
    clk : in std_logic
  );
end;

architecture alu_vio_arq of alu_vio is
  component alu is
    generic (
      N : natural := 4
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
  
  COMPONENT vio_0
    PORT (
      clk : IN STD_LOGIC;
      probe_in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  constant N_tb : natural := 4;
  signal a_tb : std_logic_vector(N_tb - 1 downto 0);
  signal b_tb : std_logic_vector(N_tb - 1 downto 0);
  signal ci_tb : std_logic;
  signal opcode_tb : std_logic_vector(3 downto 0);
  signal s_tb : std_logic_vector(N_tb - 1 downto 0);
  signal co_tb : std_logic;
begin
  alu_inst: alu
  port map(
    clk      => clk,
    a_i      => a_tb,
    b_i      => b_tb,
    ci_i     => ci_tb,
    opcode_i => opcode_tb,
    s_o      => s_tb,
    co_o     => co_tb
  );
  
  vio_inst : vio_0
    PORT MAP (
      clk => clk,
      probe_in0 => s_tb,
      probe_in1(0) => co_tb,
      probe_out0 => a_tb,
      probe_out1 => b_tb,
      probe_out2(0) => ci_tb,
      probe_out3 => opcode_tb
    );
end;
