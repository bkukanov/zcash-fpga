package blake2_pkg;

  // Initial values
  parameter [7:0][63:0] IV  = {
    64'h5be0cd19137e2179,
    64'h1f83d9abfb41bd6b,
    64'h9b05688c2b3e6c1f,
    64'h510e527fade682d1,
    64'ha54ff53a5f1d36f1,
    64'h3c6ef372fe94f82b,
    64'hbb67ae8584caa73b,
    64'h6a09e667f3bcc908
    };

  // Sigma permutations used for G function blocks and input messages
  parameter [16*10-1:0][31:0] SIGMA  = {
    32'd0, 32'd13, 32'd12, 32'd3, 32'd14, 32'd9, 32'd11, 32'd15, 32'd5, 32'd1, 32'd6, 32'd7, 32'd4, 32'd8, 32'd2, 32'd10,
    32'd5, 32'd10, 32'd4, 32'd1, 32'd7, 32'd13, 32'd2, 32'd12, 32'd8, 32'd0, 32'd3, 32'd11, 32'd9, 32'd14, 32'd15, 32'd6,
  	32'd10, 32'd2, 32'd6, 32'd8, 32'd4, 32'd15, 32'd0, 32'd5, 32'd9, 32'd3, 32'd1, 32'd12, 32'd14, 32'd7, 32'd11, 32'd13,
  	32'd11, 32'd8, 32'd2, 32'd9, 32'd3, 32'd6, 32'd7, 32'd0, 32'd10, 32'd4, 32'd13, 32'd14, 32'd15, 32'd1, 32'd5, 32'd12,
  	32'd9, 32'd1, 32'd14, 32'd15, 32'd5, 32'd7, 32'd13, 32'd4, 32'd3, 32'd8, 32'd11, 32'd0, 32'd10, 32'd6, 32'd12, 32'd2,
  	32'd13, 32'd3, 32'd8, 32'd6, 32'd12, 32'd11, 32'd1, 32'd14, 32'd15, 32'd10, 32'd4, 32'd2, 32'd7, 32'd5, 32'd0, 32'd9,
  	32'd8, 32'd15, 32'd0, 32'd4, 32'd10, 32'd5, 32'd6, 32'd2, 32'd14, 32'd11, 32'd12, 32'd13, 32'd1, 32'd3, 32'd9, 32'd7,
  	32'd4, 32'd9, 32'd1, 32'd7, 32'd6, 32'd3, 32'd14, 32'd10, 32'd13, 32'd15, 32'd2, 32'd5, 32'd0, 32'd12, 32'd8, 32'd11,
  	32'd3, 32'd5, 32'd7, 32'd11, 32'd2, 32'd0, 32'd12, 32'd1, 32'd6, 32'd13, 32'd15, 32'd9, 32'd8, 32'd4, 32'd10, 32'd14,
  	32'd15, 32'd14, 32'd13, 32'd12, 32'd11, 32'd10, 32'd9, 32'd8, 32'd7, 32'd6, 32'd5, 32'd4, 32'd3, 32'd2, 32'd1, 32'd0
  };
    
  // Mapping for each G function block to the state vector v
  parameter [4*8-1:0][31:0] G_MAPPING = {
    32'd14, 32'd9, 32'd4, 32'd3,
    32'd13, 32'd8, 32'd7, 32'd2,
    32'd12, 32'd11, 32'd6, 32'd1,
    32'd15, 32'd10, 32'd5, 32'd0,
    32'd15, 32'd11, 32'd7, 32'd3,
    32'd14, 32'd10, 32'd6, 32'd2,
    32'd13, 32'd9, 32'd5, 32'd1,
    32'd12, 32'd8, 32'd4, 32'd0
  };
    
  // This is so we can get the correct mapping back from the diagonal
  // operation 
  parameter [4*4-1:0][31:0] G_MAPPING_DIAG = {
    32'd3, 32'd15, 32'd11, 32'd7,
    32'd6, 32'd2, 32'd14, 32'd10,
    32'd9, 32'd5, 32'd1, 32'd13,
    32'd12, 32'd8 , 32'd4, 32'd0
  };

endpackage