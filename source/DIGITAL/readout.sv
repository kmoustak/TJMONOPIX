
`include "DIGITAL/eoc.sv"
`include "DIGITAL/serializer.sv"

module readout
(
    input logic ClkBx, ClkOut, Read, Freeze, 
    input logic [5:0] Bcid,
    input EnTestPattern,
    input [0:55] Enable,
    output logic DataOut,
    output logic TokenOut,
    
    input logic [0:55] TokColB,
    input logic [0:1175] DataCol,
    output logic [0:55] ReadCol,
    output logic [0:55] FreezeCol,
    output logic [0:335] BcidCol,
);

    logic [56:0] token_chip;
    logic [5:0] col_addr [56:0];
    logic [20:0] chip_col_data [56:0];
    logic [55:0][20:0] col_data;
    logic [55:0][5:0] col_bcid;
    
    assign token_chip[0] = 0;
    assign col_addr[0] = 0;
    assign col_data = DataCol;
    assign BcidCol = col_bcid;
    
    assign FreezeCol = {56{Freeze}};
    assign TokenOut = token_chip[56];
    
    
    generate
        genvar col_i;
        for (col_i=0; col_i<56; col_i=col_i+1) begin: col_gen

            logic [5:0] local_bcid;
            always_ff@(posedge ClkBx)
                local_bcid <= Bcid;
                
             
            eoc #(.ADDR(col_i)) eoc
            (
                .TokInChip(token_chip[col_i]), 
                .TokInCol(~TokColB[col_i]), 
                .Read(Read),
                .TokOutChip(token_chip[col_i+1]), 
                .ReadCol(ReadCol[col_i]),

                .ColAddrOut(col_addr[col_i+1]),
                .ColAddrIn(col_addr[col_i]),

                .ColDataOut(chip_col_data[col_i+1]),
                .ColDataIn(chip_col_data[col_i]),
                .ColData(col_data[col_i]),

                .Bcid(local_bcid),
                .BcidCol(col_bcid),

                .Enable(Enable[col_i])
            );

        end
    endgenerate

    serializer serializer (
        .ClkBx(ClkBx), 
        .ClkOut(ClkOut), 
        .Read(Read), 
        .EnTestPattern(EnTestPattern),
        .DataIn({chip_col_data[56], col_addr[56]}),
        .DataOut(DataOut)
    );

endmodule 