ghdl -a ../Fuentes/sumres1b.vhd ../Fuentes/sumres1b_tb.vhd
ghdl -s ../Fuentes/sumres1b.vhd ../Fuentes/sumres1b_tb.vhd
ghdl -e sumres1b_tb
ghdl -r sumres1b_tb --vcd=sumres1b_tb.vcd --stop-time=1000ns

gtkwave sumres1b_tb.vcd