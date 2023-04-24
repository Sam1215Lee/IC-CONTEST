
module S2 ( clk, rst, S2_done, RB2_RW, RB2_A, RB2_D, RB2_Q, sen, sd );
  output [2:0] RB2_A;
  output [17:0] RB2_D;
  input [17:0] RB2_Q;
  input clk, rst, sen, sd;
  output S2_done, RB2_RW;
  wire   n168, N84, N85, N86, N87, N88, n6, n7, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n165, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n401;

  OAI31X2 U138 ( .A0(n368), .A1(n253), .A2(n274), .B0(n200), .Y(n271) );
  DFFSX1 RB2_RW_reg ( .D(n314), .CK(clk), .SN(n197), .Q(n168), .QN(n278) );
  DFFRX1 \cnt_reg[0]  ( .D(n317), .CK(clk), .RN(n197), .Q(n221), .QN(n7) );
  DFFRX1 \cnt_reg[3]  ( .D(n371), .CK(clk), .RN(n197), .Q(n240), .QN(n280) );
  DFFRX1 \cnt_reg[1]  ( .D(n373), .CK(clk), .RN(n197), .QN(n6) );
  DFFSX1 \cnt_reg[2]  ( .D(n369), .CK(clk), .SN(n197), .Q(n213), .QN(n165) );
  DFFRX1 \RB2_D_reg[17]  ( .D(n322), .CK(clk), .RN(n401), .QN(n234) );
  DFFRX1 \RB2_D_reg[15]  ( .D(n319), .CK(clk), .RN(n401), .QN(n230) );
  DFFRX1 \RB2_D_reg[13]  ( .D(n375), .CK(clk), .RN(n401), .QN(n235) );
  DFFRX1 \RB2_D_reg[11]  ( .D(n311), .CK(clk), .RN(n197), .QN(n231) );
  DFFRX1 \RB2_D_reg[9]  ( .D(n308), .CK(clk), .RN(n197), .QN(n236) );
  DFFRX1 \RB2_D_reg[7]  ( .D(n325), .CK(clk), .RN(n197), .QN(n232) );
  DFFRX1 \RB2_D_reg[5]  ( .D(n328), .CK(clk), .RN(n197), .QN(n237) );
  DFFRX1 \RB2_D_reg[3]  ( .D(n331), .CK(clk), .RN(n197), .QN(n233) );
  DFFRX1 \RB2_D_reg[1]  ( .D(n334), .CK(clk), .RN(n197), .QN(n238) );
  DFFRX1 \RB2_D_reg[16]  ( .D(n337), .CK(clk), .RN(n401), .QN(n222) );
  DFFRX1 \RB2_D_reg[14]  ( .D(n339), .CK(clk), .RN(n401), .QN(n226) );
  DFFRX1 \RB2_D_reg[12]  ( .D(n342), .CK(clk), .RN(n401), .QN(n223) );
  DFFRX1 \RB2_D_reg[10]  ( .D(n344), .CK(clk), .RN(n401), .QN(n227) );
  DFFRX1 \RB2_D_reg[8]  ( .D(n347), .CK(clk), .RN(n401), .QN(n224) );
  DFFRX1 \RB2_D_reg[6]  ( .D(n350), .CK(clk), .RN(n401), .QN(n228) );
  DFFRX1 \RB2_D_reg[4]  ( .D(n353), .CK(clk), .RN(n401), .QN(n225) );
  DFFRX1 \RB2_D_reg[2]  ( .D(n355), .CK(clk), .RN(n401), .QN(n229) );
  DFFRX1 \RB2_A_reg[1]  ( .D(n358), .CK(clk), .RN(n197), .QN(n239) );
  DFFRXL S2_done_reg ( .D(n361), .CK(clk), .RN(n197), .QN(n305) );
  DFFRXL \RB2_A_reg[0]  ( .D(n363), .CK(clk), .RN(n197), .QN(n307) );
  DFFRXL \RB2_A_reg[2]  ( .D(n364), .CK(clk), .RN(n197), .QN(n304) );
  DFFRXL \RB2_D_reg[0]  ( .D(n365), .CK(clk), .RN(n197), .QN(n306) );
  DFFSX1 \cnt_reg[4]  ( .D(n366), .CK(clk), .SN(n197), .Q(n241), .QN(n279) );
  OAI31XL U186 ( .A0(n273), .A1(n240), .A2(n274), .B0(n200), .Y(n272) );
  NAND2X1 U187 ( .A(n275), .B(n198), .Y(N88) );
  OAI2BB2XL U188 ( .B0(n199), .B1(n303), .A0N(n199), .A1N(RB2_A[2]), .Y(n70)
         );
  OA21XL U189 ( .A0(S2_done), .A1(n214), .B0(n200), .Y(n51) );
  CLKBUFX3 U190 ( .A(n359), .Y(n358) );
  DLY4X1 U191 ( .A(n71), .Y(n359) );
  CLKBUFX3 U192 ( .A(n356), .Y(n355) );
  DLY4X1 U193 ( .A(n67), .Y(n356) );
  CLKBUFX3 U194 ( .A(n351), .Y(n350) );
  DLY4X1 U195 ( .A(n63), .Y(n351) );
  CLKBUFX3 U196 ( .A(n348), .Y(n347) );
  DLY4X1 U197 ( .A(n61), .Y(n348) );
  CLKBUFX3 U198 ( .A(n345), .Y(n344) );
  DLY4X1 U199 ( .A(n59), .Y(n345) );
  CLKBUFX3 U200 ( .A(n340), .Y(n339) );
  DLY4X1 U201 ( .A(n55), .Y(n340) );
  CLKBUFX3 U202 ( .A(n335), .Y(n334) );
  DLY2X1 U203 ( .A(n66), .Y(n332) );
  CLKBUFX3 U204 ( .A(n329), .Y(n328) );
  DLY4X1 U205 ( .A(n64), .Y(n329) );
  DLY2X1 U206 ( .A(n62), .Y(n326) );
  CLKBUFX3 U207 ( .A(n309), .Y(n308) );
  DLY4X1 U208 ( .A(n60), .Y(n309) );
  DLY2X1 U209 ( .A(n58), .Y(n312) );
  CLKBUFX3 U210 ( .A(n376), .Y(n375) );
  DLY4X1 U211 ( .A(n56), .Y(n376) );
  DLY2X1 U212 ( .A(n54), .Y(n320) );
  CLKBUFX3 U213 ( .A(n323), .Y(n322) );
  OAI211X1 U214 ( .A0(n370), .A1(n220), .B0(n277), .C0(n198), .Y(N86) );
  DLY4X1 U215 ( .A(N87), .Y(n372) );
  NOR2BX1 U216 ( .AN(n276), .B(n271), .Y(N87) );
  NAND2X4 U217 ( .A(sd), .B(n200), .Y(n303) );
  OAI32XL U218 ( .A0(n310), .A1(sen), .A2(n211), .B0(n303), .B1(n261), .Y(n60)
         );
  DLY4X1 U219 ( .A(n236), .Y(n310) );
  DLY4X1 U220 ( .A(n312), .Y(n311) );
  OAI32XL U221 ( .A0(n313), .A1(sen), .A2(n209), .B0(n303), .B1(n263), .Y(n58)
         );
  DLY4X1 U222 ( .A(n231), .Y(n313) );
  DLY4X1 U223 ( .A(n316), .Y(n314) );
  DLY2X1 U224 ( .A(n50), .Y(n316) );
  DLY4X1 U225 ( .A(n278), .Y(n315) );
  DLY4X4 U226 ( .A(N84), .Y(n317) );
  NOR2X8 U227 ( .A(n271), .B(n318), .Y(N84) );
  DLY4X1 U228 ( .A(n221), .Y(n318) );
  DLY4X1 U229 ( .A(n320), .Y(n319) );
  OAI32XL U230 ( .A0(n321), .A1(sen), .A2(n205), .B0(n303), .B1(n268), .Y(n54)
         );
  DLY4X1 U231 ( .A(n230), .Y(n321) );
  OAI32XL U232 ( .A0(n324), .A1(sen), .A2(n215), .B0(n303), .B1(n270), .Y(n52)
         );
  DLY4X4 U233 ( .A(n52), .Y(n323) );
  DLY4X1 U234 ( .A(n234), .Y(n324) );
  DLY4X1 U235 ( .A(n326), .Y(n325) );
  OAI32XL U236 ( .A0(n327), .A1(sen), .A2(n201), .B0(n303), .B1(n258), .Y(n62)
         );
  DLY4X1 U237 ( .A(n232), .Y(n327) );
  OAI32XL U238 ( .A0(n330), .A1(sen), .A2(n203), .B0(n303), .B1(n256), .Y(n64)
         );
  DLY4X1 U239 ( .A(n237), .Y(n330) );
  DLY4X1 U240 ( .A(n332), .Y(n331) );
  OAI32XL U241 ( .A0(n333), .A1(sen), .A2(n217), .B0(n303), .B1(n251), .Y(n66)
         );
  DLY4X1 U242 ( .A(n233), .Y(n333) );
  OAI32XL U243 ( .A0(n336), .A1(sen), .A2(n219), .B0(n303), .B1(n247), .Y(n68)
         );
  DLY4X4 U244 ( .A(n68), .Y(n335) );
  DLY4X1 U245 ( .A(n238), .Y(n336) );
  OAI32XL U246 ( .A0(n338), .A1(sen), .A2(n216), .B0(n303), .B1(n269), .Y(n53)
         );
  DLY4X4 U247 ( .A(n53), .Y(n337) );
  DLY4X1 U248 ( .A(n222), .Y(n338) );
  OAI32XL U249 ( .A0(n341), .A1(sen), .A2(n206), .B0(n303), .B1(n267), .Y(n55)
         );
  DLY4X1 U250 ( .A(n226), .Y(n341) );
  OAI32XL U251 ( .A0(n343), .A1(sen), .A2(n208), .B0(n303), .B1(n264), .Y(n57)
         );
  DLY4X4 U252 ( .A(n57), .Y(n342) );
  DLY4X1 U253 ( .A(n223), .Y(n343) );
  OAI32XL U254 ( .A0(n346), .A1(sen), .A2(n210), .B0(n303), .B1(n262), .Y(n59)
         );
  DLY4X1 U255 ( .A(n227), .Y(n346) );
  OAI32XL U256 ( .A0(n349), .A1(sen), .A2(n212), .B0(n303), .B1(n259), .Y(n61)
         );
  DLY4X1 U257 ( .A(n224), .Y(n349) );
  OAI32XL U258 ( .A0(n352), .A1(sen), .A2(n202), .B0(n303), .B1(n257), .Y(n63)
         );
  DLY4X1 U259 ( .A(n228), .Y(n352) );
  OAI32XL U260 ( .A0(n354), .A1(sen), .A2(n204), .B0(n303), .B1(n254), .Y(n65)
         );
  DLY4X4 U261 ( .A(n65), .Y(n353) );
  DLY4X1 U262 ( .A(n225), .Y(n354) );
  OAI32XL U263 ( .A0(n357), .A1(sen), .A2(n218), .B0(n303), .B1(n250), .Y(n67)
         );
  DLY4X1 U264 ( .A(n229), .Y(n357) );
  OAI32XL U265 ( .A0(n360), .A1(sen), .A2(n214), .B0(n303), .B1(n246), .Y(n71)
         );
  DLY4X1 U266 ( .A(n239), .Y(n360) );
  DLY4X1 U267 ( .A(n51), .Y(n361) );
  INVXL U268 ( .A(n246), .Y(n214) );
  NAND2XL U269 ( .A(n252), .B(n244), .Y(n246) );
  DLY4X1 U270 ( .A(n279), .Y(n362) );
  DLY4X4 U271 ( .A(n72), .Y(n363) );
  DLY4X1 U272 ( .A(n70), .Y(n364) );
  INVXL U273 ( .A(n272), .Y(n199) );
  DLY4X1 U274 ( .A(n69), .Y(n365) );
  BUFX2 U275 ( .A(n367), .Y(n366) );
  DLY4X1 U276 ( .A(N88), .Y(n367) );
  DLY4X4 U277 ( .A(n241), .Y(n368) );
  DLY4X4 U278 ( .A(N86), .Y(n369) );
  INVX2 U279 ( .A(n274), .Y(n220) );
  INVX1 U280 ( .A(n271), .Y(n198) );
  DLY4X1 U281 ( .A(n165), .Y(n370) );
  DLY4X1 U282 ( .A(n372), .Y(n371) );
  DLY4X1 U283 ( .A(n374), .Y(n373) );
  DLY4X4 U284 ( .A(N85), .Y(n374) );
  AOI2BB1X4 U285 ( .A0N(n252), .A1N(n220), .B0(n271), .Y(N85) );
  OAI32XL U286 ( .A0(n377), .A1(sen), .A2(n207), .B0(n303), .B1(n266), .Y(n56)
         );
  DLY4X1 U287 ( .A(n235), .Y(n377) );
  INVX3 U288 ( .A(rst), .Y(n197) );
  INVX12 U289 ( .A(n239), .Y(RB2_A[1]) );
  INVX12 U290 ( .A(n229), .Y(RB2_D[2]) );
  INVX12 U291 ( .A(n225), .Y(RB2_D[4]) );
  INVX12 U292 ( .A(n228), .Y(RB2_D[6]) );
  INVX12 U293 ( .A(n224), .Y(RB2_D[8]) );
  INVX12 U294 ( .A(n227), .Y(RB2_D[10]) );
  INVX12 U295 ( .A(n223), .Y(RB2_D[12]) );
  INVX12 U296 ( .A(n226), .Y(RB2_D[14]) );
  INVX12 U297 ( .A(n222), .Y(RB2_D[16]) );
  INVX12 U298 ( .A(n238), .Y(RB2_D[1]) );
  INVX12 U299 ( .A(n233), .Y(RB2_D[3]) );
  INVX12 U300 ( .A(n237), .Y(RB2_D[5]) );
  INVX12 U301 ( .A(n232), .Y(RB2_D[7]) );
  INVX12 U302 ( .A(n236), .Y(RB2_D[9]) );
  INVX12 U303 ( .A(n231), .Y(RB2_D[11]) );
  INVX12 U304 ( .A(n235), .Y(RB2_D[13]) );
  INVX12 U305 ( .A(n230), .Y(RB2_D[15]) );
  INVX12 U306 ( .A(n234), .Y(RB2_D[17]) );
  INVX12 U307 ( .A(n306), .Y(RB2_D[0]) );
  INVX12 U308 ( .A(n304), .Y(RB2_A[2]) );
  INVX12 U309 ( .A(n307), .Y(RB2_A[0]) );
  INVX12 U310 ( .A(n305), .Y(S2_done) );
  BUFX12 U311 ( .A(n168), .Y(RB2_RW) );
  NAND2X1 U312 ( .A(n280), .B(n370), .Y(n253) );
  NAND2X1 U313 ( .A(n6), .B(n7), .Y(n274) );
  NOR3X1 U314 ( .A(n240), .B(n370), .C(n368), .Y(n255) );
  NOR3X1 U315 ( .A(n370), .B(n280), .C(n368), .Y(n265) );
  NOR3X1 U316 ( .A(n213), .B(n280), .C(n368), .Y(n260) );
  NOR2X1 U317 ( .A(n221), .B(n6), .Y(n245) );
  NOR2X1 U318 ( .A(n253), .B(n362), .Y(n244) );
  CLKINVX1 U319 ( .A(sen), .Y(n200) );
  OAI2BB2XL U320 ( .B0(n253), .B1(n274), .A0N(n240), .A1N(n277), .Y(n276) );
  OAI21XL U321 ( .A0(n253), .A1(n274), .B0(n368), .Y(n275) );
  NAND2X1 U322 ( .A(n213), .B(n368), .Y(n273) );
  NOR2X1 U323 ( .A(n368), .B(n253), .Y(n249) );
  CLKBUFX3 U324 ( .A(n197), .Y(n401) );
  OAI21XL U325 ( .A0(n315), .A1(n271), .B0(n199), .Y(n50) );
  OAI2BB2XL U326 ( .B0(n198), .B1(n303), .A0N(n198), .A1N(RB2_D[0]), .Y(n69)
         );
  CLKINVX1 U327 ( .A(n247), .Y(n219) );
  NAND2X1 U328 ( .A(n248), .B(n249), .Y(n247) );
  CLKINVX1 U329 ( .A(n256), .Y(n203) );
  NAND2X1 U330 ( .A(n255), .B(n248), .Y(n256) );
  CLKINVX1 U331 ( .A(n261), .Y(n211) );
  NAND2X1 U332 ( .A(n260), .B(n248), .Y(n261) );
  CLKINVX1 U333 ( .A(n266), .Y(n207) );
  NAND2X1 U334 ( .A(n265), .B(n248), .Y(n266) );
  CLKINVX1 U335 ( .A(n270), .Y(n215) );
  NAND2X1 U336 ( .A(n248), .B(n244), .Y(n270) );
  CLKINVX1 U337 ( .A(n251), .Y(n217) );
  NAND2X1 U338 ( .A(n249), .B(n252), .Y(n251) );
  CLKINVX1 U339 ( .A(n258), .Y(n201) );
  NAND2X1 U340 ( .A(n255), .B(n252), .Y(n258) );
  CLKINVX1 U341 ( .A(n263), .Y(n209) );
  NAND2X1 U342 ( .A(n260), .B(n252), .Y(n263) );
  CLKINVX1 U343 ( .A(n268), .Y(n205) );
  NAND2X1 U344 ( .A(n265), .B(n252), .Y(n268) );
  CLKINVX1 U345 ( .A(n250), .Y(n218) );
  NAND2X1 U346 ( .A(n249), .B(n245), .Y(n250) );
  CLKINVX1 U347 ( .A(n257), .Y(n202) );
  NAND2X1 U348 ( .A(n255), .B(n245), .Y(n257) );
  CLKINVX1 U349 ( .A(n262), .Y(n210) );
  NAND2X1 U350 ( .A(n260), .B(n245), .Y(n262) );
  CLKINVX1 U351 ( .A(n267), .Y(n206) );
  NAND2X1 U352 ( .A(n265), .B(n245), .Y(n267) );
  CLKINVX1 U353 ( .A(n254), .Y(n204) );
  NAND2X1 U354 ( .A(n255), .B(n220), .Y(n254) );
  CLKINVX1 U355 ( .A(n259), .Y(n212) );
  NAND2X1 U356 ( .A(n260), .B(n220), .Y(n259) );
  CLKINVX1 U357 ( .A(n264), .Y(n208) );
  NAND2X1 U358 ( .A(n265), .B(n220), .Y(n264) );
  CLKINVX1 U359 ( .A(n269), .Y(n216) );
  NAND2X1 U360 ( .A(n220), .B(n244), .Y(n269) );
  OAI2BB2XL U361 ( .B0(n242), .B1(n303), .A0N(n242), .A1N(RB2_A[0]), .Y(n72)
         );
  AOI21X1 U362 ( .A0(n244), .A1(n245), .B0(sen), .Y(n242) );
  NOR2X2 U363 ( .A(n7), .B(n6), .Y(n252) );
  AND2X2 U364 ( .A(n6), .B(n318), .Y(n248) );
  NAND2X1 U365 ( .A(n220), .B(n370), .Y(n277) );
endmodule

