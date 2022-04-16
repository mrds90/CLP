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

begin

  port map(
    clk      =>
    a_i      =>
    b_i      =>
    ci_i     =>
    opcode_i =>
    s_o      =>
    co_o     =>
  );
end;
