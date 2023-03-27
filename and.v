module gateand(
    input a,
    input b,
    output y
    );
	 
	 LUT3 #(
    .INIT(4'h8)
  ) lut_inst (
    .O(y),
    .I0(a),
    .I1(b),.I2(0));


endmodule
