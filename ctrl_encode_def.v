// PCSrc select singal
`define PCSRC_XADR 2'b101 // for exception
`define PCSRC_ILLOP 2'b100 // for break
`define PCSRC_JR 2'b011
`define PCSRC_JT 2'b010
`define PCSRC_BT 2'b001
`define PCSRC_PLUS4 2'b000

// EXT control signal
`define EXT_ZERO    2'b00
`define EXT_SIGNED  2'b01
`define EXT_HIGHPOS 2'b10

// ALU control signal
`define ALU_NOP   5'b00000 
`define ALU_ADDU  5'b00001
`define ALU_ADD   5'b00010
`define ALU_SUBU  5'b00011
`define ALU_SUB   5'b00100 
`define ALU_AND   5'b00101
`define ALU_OR    5'b00110
`define ALU_NOR   5'b00111
`define ALU_XOR   5'b01000
`define ALU_SLT   5'b01001
`define ALU_SLTU  5'b01010 
`define ALU_EQL   5'b01011
`define ALU_BNE   5'b01100
`define ALU_GT0   5'b01101
`define ALU_GE0   5'b01110
`define ALU_LT0   5'b01111
`define ALU_LE0   5'b10000
`define ALU_SLL   5'b10001
`define ALU_SRL   5'b10010
`define ALU_SRA   5'b10011

`define ALU_SRC_A_RS 2'b0
`define ALU_SRC_A_SHAMT 2'b1
`define ALU_SRC_B_RT 2'b0
`define ALU_SRC_B_LU 2'B1

// GPR control signal
`define GPR_RD   2'b00
`define GPR_RT   2'b01
`define GPR_RA   2'b10
`define GPR_XP 2'b11

`define M2R_ALU 2'b00
`define M2R_MEM 2'b01
`define M2R_PCPLUS4  2'b10

// Memory control signal
`define DM_R_OFF 1'b0
`define DM_R_ON 1'b0
`define DM_W_OFF 1'b0
`define DM_W_ON 1'b1

// Forward unit signal
`define FU_JR_RS 2'b00
`define FU_JR_ALU 2'b01
`define FU_JR_MR 2'b10
`define FU_JR_RW 2'b11

`define FU_ALUSRC_A_SHAMT 2'b00
`define FU_ALUSRC_A_RW 2'b01
`define FU_ALUSRC_A_ALU 2'b10
`define FU_ALUSRC_A_RS 2'b11
`define FU_ALUSRC_B_RW 2'b00
`define FU_ALUSRC_B_ALU 2'b01
`define FU_ALUSRC_B_RT 2'b10
`define FU_ALUSRC_B_LU 2'B11

//LU
`define LU_EXT 2'b0
`define LU_ZERO 2'b1

//HU
`define PC_WRITE_OFF 2'b0
`define PC_WRITE_ON 2'b1

`define IF_ID_W