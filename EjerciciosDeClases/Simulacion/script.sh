ghdl -a ../Fuentes/sumres1b.vhd
ghdl -s ../Fuentes/sumres1b.vhd
ghdl -a ../Fuentes/sumres4b.vhd ../Fuentes/sumres4b_tb.vhd
ghdl -s ../Fuentes/sumres4b.vhd ../Fuentes/sumres4b_tb.vhd
ghdl -e sumres4b_tb
ghdl -r sumres4b_tb --vcd=sumres4b_tb.vcd --stop-time=10240ns

gtkwave sumres4b_tb.vcd