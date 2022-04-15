ghdl -a ../Fuentes/alu.vhd ../Fuentes/alu_tb.vhd
ghdl -s ../Fuentes/alu.vhd ../Fuentes/alu_tb.vhd
ghdl -e alu_tb
ghdl -r alu_tb --vcd=alu_tb.vcd --stop-time=10240ns

gtkwave alu_tb.vcd