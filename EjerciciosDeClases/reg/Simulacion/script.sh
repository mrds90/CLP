ghdl -a ../Fuentes/reg.vhd ../Fuentes/reg_tb.vhd
ghdl -s ../Fuentes/reg.vhd ../Fuentes/reg_tb.vhd
ghdl -e reg_tb
ghdl -r reg_tb --vcd=reg_tb.vcd --stop-time=1000ns

gtkwave reg_tb.vcd