# TJ-MONOPIX
Repository for TJ-MONOPIX project


## Usage:

```bash
mkdir work
cd work
```
### Synthesis & P&R:

```bash
genus -legacy_ui -f ../scripts/syn.tcl
```

```bash
innovus -init ../scripts/pnr.tcl
```

### Simulation:

```bash
vsim -do ../scripts/vsim.tcl
```


# CAM synthesis flow

#### RTL Compiler RC14.11 - v14.10-s012_1
#### Encounter 14.10

### Synthesis & P&R:

```bash
MONOPIX_CAM_FLOW/syn/work/ rc -files ../scripts/rtl.tcl 
```

### Synthesis & P&R:

```bash
MONOPIX_CAM_FLOW/pnr/work/ encounter -init ../scripts/top-level.tcl
```


