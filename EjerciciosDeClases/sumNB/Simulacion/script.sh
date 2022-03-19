ghdl -a ../Fuentes/sumNB.vhd ../Fuentes/sumNB_tb.vhd
ghdl -s ../Fuentes/sumNB.vhd ../Fuentes/sumNB_tb.vhd
ghdl -e sumNB_tb
ghdl -r sumNB_tb --vcd=sumNB_tb.vcd --stop-time=1000ns

gtkwave sumNB_tb.vcd