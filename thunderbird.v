module thunderbird(input left, right, hazard, clk, output Lc,  Lb, La, Ra, Rb, Rc, E1, E2, E3);
    	

    	wire e1n, e2n, e3n;

    	wire e1o1, e1o2, e1o3;
    	wire e2o1, e2o2, e2o3, e2o4;
    	wire e3o1, e3o2, e3o3;

    	wire t1, t2, t3;
	//E1
	and(e1o1, E1, ~E2, right, ~hazard);
	and(e1o2, ~E1, ~E2, ~E3, hazard);
	and(e1o3, right, ~hazard, ~E2, ~E3);
	or(e1n, e1o1, e1o2, e1o3);
	//E2
	and(e2o1, hazard, ~E1, ~E2, ~E3);
	and(e2o2, right, ~hazard,  E1, ~E2, E3);
	and(e2o3, left, ~hazard, ~E1, ~E2, E3);
	and(e2o4, left, ~right, ~E1, E2, ~E3);
	or(e2n, e2o1, e2o2, e2o3, e2o4);
	//E3
	and(e3o1, left, ~hazard, ~E1, ~E3);
	and(e3o2, hazard, ~E1, ~E2, ~E3);
	and(e3o3, right, ~hazard, E1, ~E2, ~E3);
	or(e3n, e3o1, e3o2, e3o3);
	
	dff u1 (.D(e1n), .clk(clk), .Q(E1));
	dff u2 (.D(e2n), .clk(clk), .Q(E2));
	dff u3 (.D(e3n), .clk(clk), .Q(E3));
	
	and(Lc, E2, E3);
	and(t1, ~E1, E2);
	or(Lb, t1, Lc);
	and(t2, ~E1, E3);
	or(La, Lc, Lb, t2);

	and(Rc, E1, E2);
	and(t3, E1, E3);
	or(Rb, Rc, t3);
	assign Ra = E1;
	
	
endmodule

module dff(input D, clk, output reg Q=1'b0);
	always @(posedge clk) begin
		Q <= D;
	end
endmodule