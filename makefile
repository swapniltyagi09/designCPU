VERILOG_COMPILER = iverilog
WAVEFORM_VIEWER = gtkwave

SRC_DIR = rtl
TB_DIR = testbench

BUILD_DIR = sim
TOP_MODULE ?= tb_top # Allow overriding the top module (testbench) via command line
SIM_OUT = $(BUILD_DIR)/$(TOP_MODULE).out


VCD_NAME = $(TOP_MODULE)_waveform.vcd
# CORRECTED: Typo in build directory variable
VCD_FILE = $(BUILD_DIR)/$(VCD_NAME)

# CORRECTED: File pattern typos (*.v instead of .v)
VERILOG_SRC = $(wildcard $(SRC_DIR)/*.v)
VERILOG_TB = $(wildcard $(TB_DIR)/*.v)
ALL_VERILOG_FILES = $(VERILOG_SRC) $(VERILOG_TB)

.PHONY: all build simulate wave clean

all: simulate

# Target to create the build directory
$(BUILD_DIR):
	@mkdir -p $@

build: $(BUILD_DIR)
	@echo "Compiling Verilog files..."
	$(VERILOG_COMPILER) -o $(SIM_OUT) -s $(TOP_MODULE) $(ALL_VERILOG_FILES)
	@echo "Compilation successful. Output: $(SIM_OUT)"

simulate: build
	@echo "Starting simulation for module: $(TOP_MODULE)..."
	# NOTE: The testbench must use the path $(VCD_FILE) (i.e., "sim/tb_top.vcd") 
	# within the $dumpfile() system task to generate the waveform.
	vvp $(SIM_OUT)
	@echo "Simulation finished. Waveform file: $(VCD_FILE)"

wave:
	@echo "Opening waveform file: $(VCD_FILE)..."
	$(WAVEFORM_VIEWER) $(VCD_FILE) &

clean:
	@echo "Cleaning up build directories..."
	rm -rf $(BUILD_DIR)
