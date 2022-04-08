`timescale 1ns/1ns
module DMEM(addr, data, ctrl_rd, ctrl_wrt, rd_data);
    input ctrl_rd, ctrl_wrt;
    input [7:0] addr, data;
    output reg [7:0] rd_data;

reg [7:0] dmem [255:0];

initial
    begin
        if(ctrl_wrt) dmem[addr] = data;
        if(ctrl_rd)  rd_data = dmem[addr];
    end

initial
    begin 
        $monitor($time,, "wrt= %d, rd= %d, dmem[addr]= %d, rd_data= %d",ctrl_wrt, ctrl_rd, dmem[addr], rd_data);
        $display($time,,"wrt= %d, rd= %d, dmem[addr]= %d, rd_data= %d",ctrl_wrt, ctrl_rd, dmem[addr], rd_data);
        #10 
        #10 // Required for iverilog to show final values
        $display($time,,"wrt= %d, rd= %d, dmem[addr]= %d, rd_data= %d",ctrl_wrt, ctrl_rd, dmem[addr], rd_data);
    end
endmodule