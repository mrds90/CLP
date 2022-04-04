ghdl -a ../Fuentes/sumres1b.vhd
ghdl -s ../Fuentes/sumres1b.vhd
ghdl -a ../Fuentes/sumresNb.vhd ../Fuentes/sumresNb_tb.vhd
ghdl -s ../Fuentes/sumresNb.vhd ../Fuentes/sumresNb_tb.vhd
ghdl -e sumresNb_tb
ghdl -r sumresNb_tb --vcd=sumresNb_tb.vcd --stop-time=10240ns

gtkwave sumresNb_tb.vcd