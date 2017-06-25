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

```bash
export TSL_LIB_PATH= ... /tsl18fs120_Rev_2015.08
export TSL_PDK_PATH= ... /ts18is_6M1L_5p3
```

### Synthesis & P&R:

```bash
MONOPIX_CAM_FLOW/syn/work/ rc -files ../scripts/rtl.tcl 
```

### Synthesis & P&R:

```bash
cd MONOPIX_CAM_FLOW/pnr/work
cp ../scripts/cds.lib .
encounter -init ../scripts/init.tcl
encounter -init ../scripts/top-level.tcl
```


