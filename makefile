compile:
	vlib work;
	vlog -sv \
	+acc \
	+cover \
	+fcover \
	debouncer.v \
	debouncer_tb.v

simulate:
	vsim -vopt work.debouncer_tb \
	-voptargs=+acc=npr \
	-assertdebug \
	-l debouncer.log \
	-sva \
	-coverage \
	-c -do "log -r /*; add wave -r /*; coverage save -onexit -assert -directive -cvg -codeAll debouncer_coverage.ucdb; run -all; exit" \
	-wlf debouncer_waveform.wlf

all:
	make compile
	make simulate
