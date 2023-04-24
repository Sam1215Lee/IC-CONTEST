
module triangle ( clk, reset, nt, xi, yi, busy, po, xo, yo );
  input [2:0] xi;
  input [2:0] yi;
  output [2:0] xo;
  output [2:0] yo;
  input clk, reset, nt;
  output busy, po;
  wire   \next_state[1] , n48, n58, n59, n60, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409;
  wire   [3:0] now_x;
  wire   [3:0] x3;
  wire   [3:0] now_y;
  wire   [3:0] y3;
  wire   [3:0] x2;
  wire   [3:0] y2;

  DFFRX1 \cur_state_reg[0]  ( .D(n409), .CK(clk), .RN(n408), .Q(n221), .QN(
        n403) );
  DFFRX1 \cur_state_reg[1]  ( .D(\next_state[1] ), .CK(clk), .RN(n408), .Q(
        n216), .QN(n48) );
  EDFFX1 \x1_reg[2]  ( .D(xi[2]), .E(n406), .CK(clk), .QN(n58) );
  EDFFX1 \x1_reg[1]  ( .D(xi[1]), .E(n406), .CK(clk), .QN(n59) );
  EDFFX1 \x1_reg[0]  ( .D(xi[0]), .E(n406), .CK(clk), .QN(n60) );
  EDFFX1 \x2_reg[0]  ( .D(xi[0]), .E(n405), .CK(clk), .QN(n217) );
  EDFFX1 \y1_reg[2]  ( .D(yi[2]), .E(n406), .CK(clk), .QN(n226) );
  EDFFX1 \y1_reg[1]  ( .D(yi[1]), .E(n406), .CK(clk), .QN(n225) );
  EDFFX1 \y1_reg[0]  ( .D(yi[0]), .E(n406), .CK(clk), .QN(n227) );
  EDFFX1 \y3_reg[0]  ( .D(yi[0]), .E(n407), .CK(clk), .QN(n219) );
  DFFRX1 \xo_reg[0]  ( .D(n205), .CK(clk), .RN(n408), .Q(xo[0]), .QN(n401) );
  DFFRX1 busy_reg ( .D(n207), .CK(clk), .RN(n408), .Q(busy), .QN(n402) );
  DFFRX1 po_reg ( .D(n206), .CK(clk), .RN(n408), .Q(po), .QN(n404) );
  DFFRX1 \yo_reg[0]  ( .D(n202), .CK(clk), .RN(n408), .Q(yo[0]), .QN(n398) );
  DFFRX1 \yo_reg[1]  ( .D(n201), .CK(clk), .RN(n408), .Q(yo[1]), .QN(n397) );
  DFFRX1 \yo_reg[2]  ( .D(n200), .CK(clk), .RN(n408), .Q(yo[2]), .QN(n396) );
  DFFRX1 \xo_reg[1]  ( .D(n204), .CK(clk), .RN(n408), .Q(xo[1]), .QN(n400) );
  DFFRX1 \xo_reg[2]  ( .D(n203), .CK(clk), .RN(n408), .Q(xo[2]), .QN(n399) );
  EDFFX1 \y2_reg[2]  ( .D(yi[2]), .E(n405), .CK(clk), .Q(y2[2]), .QN(n218) );
  DFFQX1 \now_x_reg[2]  ( .D(n211), .CK(clk), .Q(now_x[2]) );
  DFFQX1 \now_y_reg[3]  ( .D(n214), .CK(clk), .Q(now_y[3]) );
  DFFQX1 \now_x_reg[3]  ( .D(n213), .CK(clk), .Q(now_x[3]) );
  EDFFX1 \y2_reg[1]  ( .D(yi[1]), .E(n405), .CK(clk), .Q(y2[1]), .QN(n223) );
  EDFFX1 \x3_reg[2]  ( .D(xi[2]), .E(n407), .CK(clk), .Q(x3[2]), .QN(n222) );
  EDFFX1 \y2_reg[0]  ( .D(yi[0]), .E(n405), .CK(clk), .Q(y2[0]) );
  EDFFX1 \x2_reg[2]  ( .D(xi[2]), .E(n405), .CK(clk), .Q(x2[2]), .QN(n220) );
  EDFFX1 \y3_reg[1]  ( .D(yi[1]), .E(n407), .CK(clk), .Q(y3[1]) );
  DFFQX1 \now_y_reg[0]  ( .D(n210), .CK(clk), .Q(now_y[0]) );
  EDFFX1 \y3_reg[2]  ( .D(yi[2]), .E(n407), .CK(clk), .Q(y3[2]) );
  DFFQX1 \now_x_reg[1]  ( .D(n212), .CK(clk), .Q(now_x[1]) );
  DFFQX1 \now_y_reg[1]  ( .D(n209), .CK(clk), .Q(now_y[1]) );
  EDFFX1 \x3_reg[1]  ( .D(xi[1]), .E(n407), .CK(clk), .Q(x3[1]), .QN(n224) );
  EDFFX1 \x3_reg[0]  ( .D(xi[0]), .E(n407), .CK(clk), .Q(x3[0]) );
  DFFQX1 \now_y_reg[2]  ( .D(n208), .CK(clk), .Q(now_y[2]) );
  EDFFX1 \x2_reg[1]  ( .D(xi[1]), .E(n405), .CK(clk), .Q(x2[1]) );
  DFFQX1 \now_x_reg[0]  ( .D(n215), .CK(clk), .Q(now_x[0]) );
  OAI21XL U189 ( .A0(n403), .A1(n228), .B0(n229), .Y(\next_state[1] ) );
  NOR2X1 U190 ( .A(n48), .B(n230), .Y(n228) );
  NOR3X1 U191 ( .A(n216), .B(reset), .C(n403), .Y(n405) );
  NOR3X1 U192 ( .A(n231), .B(reset), .C(n216), .Y(n406) );
  CLKINVX1 U193 ( .A(n232), .Y(n407) );
  OAI211X1 U194 ( .A0(n48), .A1(n233), .B0(n231), .C0(n229), .Y(n409) );
  OAI21XL U195 ( .A0(n234), .A1(n60), .B0(n235), .Y(n215) );
  MXI2X1 U196 ( .A(n236), .B(n237), .S0(now_x[0]), .Y(n235) );
  MXI2X1 U197 ( .A(n238), .B(n239), .S0(now_y[3]), .Y(n214) );
  AOI21X1 U198 ( .A0(n240), .A1(n241), .B0(n242), .Y(n239) );
  NAND3X1 U199 ( .A(now_y[2]), .B(now_y[1]), .C(n243), .Y(n238) );
  AO22X1 U200 ( .A0(n244), .A1(now_x[3]), .B0(now_x[2]), .B1(n245), .Y(n213)
         );
  OAI21XL U201 ( .A0(n234), .A1(n59), .B0(n246), .Y(n212) );
  MXI2X1 U202 ( .A(n247), .B(n248), .S0(now_x[1]), .Y(n246) );
  NOR2X1 U203 ( .A(n249), .B(n250), .Y(n247) );
  OAI21XL U204 ( .A0(n234), .A1(n58), .B0(n251), .Y(n211) );
  MXI2X1 U205 ( .A(n245), .B(n244), .S0(now_x[2]), .Y(n251) );
  AO21X1 U206 ( .A0(n252), .A1(n236), .B0(n248), .Y(n244) );
  OAI21XL U207 ( .A0(now_x[0]), .A1(n250), .B0(n253), .Y(n248) );
  NOR3X1 U208 ( .A(n249), .B(n252), .C(n250), .Y(n245) );
  CLKINVX1 U209 ( .A(n236), .Y(n250) );
  NOR2X1 U210 ( .A(n254), .B(n237), .Y(n236) );
  AO21X1 U211 ( .A0(n229), .A1(n255), .B0(n237), .Y(n234) );
  CLKINVX1 U212 ( .A(n253), .Y(n237) );
  OAI21XL U213 ( .A0(reset), .A1(n256), .B0(n232), .Y(n253) );
  OAI21XL U214 ( .A0(n227), .A1(n257), .B0(n258), .Y(n210) );
  MXI2X1 U215 ( .A(n259), .B(n260), .S0(now_y[0]), .Y(n258) );
  NOR2X1 U216 ( .A(n260), .B(n256), .Y(n259) );
  OAI21XL U217 ( .A0(n225), .A1(n257), .B0(n261), .Y(n209) );
  MXI2X1 U218 ( .A(n243), .B(n262), .S0(now_y[1]), .Y(n261) );
  OAI21XL U219 ( .A0(n226), .A1(n257), .B0(n263), .Y(n208) );
  MXI2X1 U220 ( .A(n264), .B(n242), .S0(now_y[2]), .Y(n263) );
  AO21X1 U221 ( .A0(n265), .A1(n240), .B0(n262), .Y(n242) );
  OAI21XL U222 ( .A0(now_y[0]), .A1(n256), .B0(n266), .Y(n262) );
  NOR2BX1 U223 ( .AN(n243), .B(n265), .Y(n264) );
  NOR3X1 U224 ( .A(n267), .B(n260), .C(n256), .Y(n243) );
  CLKINVX1 U225 ( .A(n266), .Y(n260) );
  NAND2X1 U226 ( .A(n268), .B(n266), .Y(n257) );
  OAI31XL U227 ( .A0(n255), .A1(reset), .A2(n256), .B0(n232), .Y(n266) );
  NAND2X1 U228 ( .A(n268), .B(n408), .Y(n232) );
  CLKINVX1 U229 ( .A(reset), .Y(n408) );
  CLKINVX1 U230 ( .A(n229), .Y(n268) );
  NAND2X1 U231 ( .A(n403), .B(n216), .Y(n229) );
  MXI2X1 U232 ( .A(n221), .B(n402), .S0(n269), .Y(n207) );
  AOI2BB2X1 U233 ( .B0(n240), .B1(n233), .A0N(n216), .A1N(n231), .Y(n269) );
  NAND2X1 U234 ( .A(nt), .B(n403), .Y(n231) );
  OAI22XL U235 ( .A0(n240), .A1(n404), .B0(n233), .B1(n254), .Y(n206) );
  CLKINVX1 U236 ( .A(n230), .Y(n233) );
  NAND4X1 U237 ( .A(n270), .B(n271), .C(n272), .D(n273), .Y(n230) );
  NOR4X1 U238 ( .A(n274), .B(n275), .C(n276), .D(n277), .Y(n273) );
  AND2X1 U239 ( .A(n278), .B(n279), .Y(n275) );
  MXI2X1 U240 ( .A(n280), .B(n281), .S0(now_x[1]), .Y(n272) );
  OAI21XL U241 ( .A0(now_x[0]), .A1(n224), .B0(n279), .Y(n281) );
  NOR2X1 U242 ( .A(x3[1]), .B(now_x[0]), .Y(n280) );
  MXI2X1 U243 ( .A(n282), .B(n222), .S0(now_x[3]), .Y(n271) );
  NOR2X1 U244 ( .A(n279), .B(n222), .Y(n282) );
  MXI2X1 U245 ( .A(n283), .B(now_x[0]), .S0(x3[0]), .Y(n270) );
  MXI2X1 U246 ( .A(n249), .B(n401), .S0(n254), .Y(n205) );
  CLKINVX1 U247 ( .A(now_x[0]), .Y(n249) );
  MXI2X1 U248 ( .A(n252), .B(n400), .S0(n254), .Y(n204) );
  MXI2X1 U249 ( .A(n284), .B(n399), .S0(n254), .Y(n203) );
  MXI2X1 U250 ( .A(n267), .B(n398), .S0(n254), .Y(n202) );
  MXI2X1 U251 ( .A(n265), .B(n397), .S0(n254), .Y(n201) );
  MXI2X1 U252 ( .A(n241), .B(n396), .S0(n254), .Y(n200) );
  NAND2X1 U253 ( .A(n240), .B(n255), .Y(n254) );
  OAI211X1 U254 ( .A0(n285), .A1(n286), .B0(n287), .C0(n288), .Y(n255) );
  NAND4BX1 U255 ( .AN(n283), .B(n289), .C(n290), .D(n291), .Y(n288) );
  NOR2X1 U256 ( .A(n278), .B(n292), .Y(n291) );
  XOR2X1 U257 ( .A(x3[0]), .B(now_x[0]), .Y(n292) );
  AO21X1 U258 ( .A0(n252), .A1(x3[1]), .B0(now_x[3]), .Y(n278) );
  AO21X1 U259 ( .A0(n241), .A1(y3[2]), .B0(n274), .Y(n289) );
  NOR2BX1 U260 ( .AN(n293), .B(n277), .Y(n274) );
  OAI31XL U261 ( .A0(n219), .A1(now_y[0]), .A2(n294), .B0(n295), .Y(n293) );
  OAI21XL U262 ( .A0(x3[1]), .A1(n252), .B0(n279), .Y(n283) );
  XOR2X1 U263 ( .A(x3[2]), .B(n284), .Y(n279) );
  NAND4X1 U264 ( .A(n296), .B(n297), .C(n298), .D(n299), .Y(n287) );
  AOI211X1 U265 ( .A0(n300), .A1(n301), .B0(now_y[3]), .C0(now_x[3]), .Y(n299)
         );
  OAI211X1 U266 ( .A0(x2[1]), .A1(n302), .B0(n303), .C0(n304), .Y(n301) );
  OAI21XL U267 ( .A0(now_x[0]), .A1(n217), .B0(now_x[1]), .Y(n303) );
  NOR3X1 U268 ( .A(n217), .B(now_x[1]), .C(now_x[0]), .Y(n302) );
  XOR2X1 U269 ( .A(n225), .B(now_y[1]), .Y(n298) );
  XOR2X1 U270 ( .A(n226), .B(now_y[2]), .Y(n297) );
  XOR2X1 U271 ( .A(n227), .B(now_y[0]), .Y(n296) );
  OAI221XL U272 ( .A0(n305), .A1(n306), .B0(y3[2]), .B1(n241), .C0(n307), .Y(
        n286) );
  CLKINVX1 U273 ( .A(n276), .Y(n307) );
  OAI21XL U274 ( .A0(n277), .A1(n308), .B0(n290), .Y(n276) );
  CLKINVX1 U275 ( .A(now_y[3]), .Y(n290) );
  AOI31X1 U276 ( .A0(now_y[0]), .A1(n219), .A2(n295), .B0(n294), .Y(n308) );
  NOR2X1 U277 ( .A(n265), .B(y3[1]), .Y(n294) );
  NAND2X1 U278 ( .A(y3[1]), .B(n265), .Y(n295) );
  CLKINVX1 U279 ( .A(now_y[1]), .Y(n265) );
  XOR2X1 U280 ( .A(y3[2]), .B(now_y[2]), .Y(n277) );
  OAI211X1 U281 ( .A0(n309), .A1(n310), .B0(n311), .C0(n312), .Y(n285) );
  NOR2X1 U282 ( .A(now_x[3]), .B(n313), .Y(n312) );
  OAI2BB1X1 U283 ( .A0N(n310), .A1N(n309), .B0(n314), .Y(n311) );
  XOR2X1 U284 ( .A(n315), .B(n316), .Y(n314) );
  XOR2X1 U285 ( .A(n317), .B(n318), .Y(n316) );
  XOR2X1 U286 ( .A(n319), .B(n320), .Y(n318) );
  NAND2X1 U287 ( .A(n321), .B(n322), .Y(n320) );
  OAI211X1 U288 ( .A0(n323), .A1(n241), .B0(n324), .C0(n325), .Y(n319) );
  OAI21XL U289 ( .A0(now_y[2]), .A1(n326), .B0(n218), .Y(n324) );
  CLKINVX1 U290 ( .A(n326), .Y(n323) );
  NOR2X1 U291 ( .A(n327), .B(n328), .Y(n317) );
  XOR2X1 U292 ( .A(n329), .B(n330), .Y(n315) );
  NOR2X1 U293 ( .A(n331), .B(n332), .Y(n330) );
  XNOR2X1 U294 ( .A(n333), .B(n334), .Y(n329) );
  OAI211X1 U295 ( .A0(n335), .A1(n220), .B0(n336), .C0(n337), .Y(n334) );
  OAI21XL U296 ( .A0(x2[2]), .A1(n338), .B0(n222), .Y(n336) );
  CLKINVX1 U297 ( .A(n338), .Y(n335) );
  OAI2BB1X1 U298 ( .A0N(n339), .A1N(n340), .B0(n341), .Y(n333) );
  OAI21XL U299 ( .A0(n340), .A1(n339), .B0(n342), .Y(n341) );
  XOR2X1 U300 ( .A(n343), .B(n344), .Y(n310) );
  XOR2X1 U301 ( .A(n345), .B(n346), .Y(n344) );
  OAI211X1 U302 ( .A0(y2[2]), .A1(n347), .B0(n348), .C0(n349), .Y(n346) );
  OAI21XL U303 ( .A0(n218), .A1(n350), .B0(y3[2]), .Y(n348) );
  NAND2X1 U304 ( .A(n351), .B(n352), .Y(n345) );
  XOR2X1 U305 ( .A(n353), .B(n354), .Y(n343) );
  AOI211X1 U306 ( .A0(n355), .A1(n356), .B0(n357), .C0(n358), .Y(n354) );
  OAI2BB1X1 U307 ( .A0N(n359), .A1N(n360), .B0(n361), .Y(n353) );
  OAI21XL U308 ( .A0(n360), .A1(n359), .B0(n362), .Y(n361) );
  OA21XL U309 ( .A0(n363), .A1(n364), .B0(n365), .Y(n309) );
  OAI2BB1X1 U310 ( .A0N(n364), .A1N(n363), .B0(n366), .Y(n365) );
  XNOR2X1 U311 ( .A(n342), .B(n367), .Y(n366) );
  XNOR2X1 U312 ( .A(n340), .B(n339), .Y(n367) );
  AND3X1 U313 ( .A(n322), .B(n325), .C(n368), .Y(n339) );
  NOR2X1 U314 ( .A(n328), .B(n369), .Y(n340) );
  XNOR2X1 U315 ( .A(n370), .B(n326), .Y(n328) );
  OAI2BB1X1 U316 ( .A0N(n371), .A1N(now_y[1]), .B0(n372), .Y(n326) );
  OAI21XL U317 ( .A0(now_y[1]), .A1(n371), .B0(n223), .Y(n372) );
  XOR2X1 U318 ( .A(n218), .B(now_y[2]), .Y(n370) );
  XOR2X1 U319 ( .A(n332), .B(n331), .Y(n342) );
  NAND2BX1 U320 ( .AN(n327), .B(n322), .Y(n331) );
  NAND2X1 U321 ( .A(n321), .B(n337), .Y(n332) );
  XOR2X1 U322 ( .A(n373), .B(n338), .Y(n321) );
  OAI2BB1X1 U323 ( .A0N(n374), .A1N(x2[1]), .B0(n375), .Y(n338) );
  OAI21XL U324 ( .A0(x2[1]), .A1(n374), .B0(n224), .Y(n375) );
  XOR2X1 U325 ( .A(n220), .B(x3[2]), .Y(n373) );
  XOR2X1 U326 ( .A(n362), .B(n376), .Y(n364) );
  XOR2X1 U327 ( .A(n359), .B(n360), .Y(n376) );
  NOR2BX1 U328 ( .AN(n351), .B(n377), .Y(n360) );
  NOR2BX1 U329 ( .AN(n305), .B(n304), .Y(n351) );
  CLKINVX1 U330 ( .A(n306), .Y(n304) );
  NAND2BX1 U331 ( .AN(n313), .B(n300), .Y(n306) );
  NAND2X1 U332 ( .A(x2[2]), .B(n284), .Y(n300) );
  NOR2X1 U333 ( .A(n284), .B(x2[2]), .Y(n313) );
  CLKINVX1 U334 ( .A(now_x[2]), .Y(n284) );
  OA21XL U335 ( .A0(n252), .A1(n378), .B0(n379), .Y(n305) );
  AO21X1 U336 ( .A0(n378), .A1(n252), .B0(x2[1]), .Y(n379) );
  CLKINVX1 U337 ( .A(now_x[1]), .Y(n252) );
  NOR3X1 U338 ( .A(n358), .B(n377), .C(n380), .Y(n359) );
  XOR2X1 U339 ( .A(n355), .B(n356), .Y(n362) );
  NOR2BX1 U340 ( .AN(n352), .B(n358), .Y(n356) );
  NOR2BX1 U341 ( .AN(n349), .B(n357), .Y(n355) );
  XOR2X1 U342 ( .A(n381), .B(n347), .Y(n357) );
  CLKINVX1 U343 ( .A(n350), .Y(n347) );
  OAI2BB1X1 U344 ( .A0N(n223), .A1N(n382), .B0(n383), .Y(n350) );
  OAI21XL U345 ( .A0(n223), .A1(n382), .B0(y3[1]), .Y(n383) );
  XOR2X1 U346 ( .A(n218), .B(y3[2]), .Y(n381) );
  CLKINVX1 U347 ( .A(n384), .Y(n363) );
  OAI32X1 U348 ( .A0(n385), .A1(n386), .A2(n369), .B0(n387), .B1(n388), .Y(
        n384) );
  CLKINVX1 U349 ( .A(n325), .Y(n369) );
  AO22X1 U350 ( .A0(n388), .A1(n387), .B0(n389), .B1(n349), .Y(n385) );
  XOR2X1 U351 ( .A(n390), .B(n368), .Y(n387) );
  NOR2X1 U352 ( .A(n327), .B(n386), .Y(n368) );
  CLKINVX1 U353 ( .A(n337), .Y(n386) );
  OAI21XL U354 ( .A0(y2[0]), .A1(n267), .B0(n371), .Y(n337) );
  XOR2X1 U355 ( .A(n374), .B(n391), .Y(n327) );
  XOR2X1 U356 ( .A(x3[1]), .B(x2[1]), .Y(n391) );
  NAND2X1 U357 ( .A(n322), .B(n325), .Y(n390) );
  OAI21XL U358 ( .A0(x3[0]), .A1(n217), .B0(n374), .Y(n325) );
  NAND2X1 U359 ( .A(x3[0]), .B(n217), .Y(n374) );
  XNOR2X1 U360 ( .A(n371), .B(n392), .Y(n322) );
  XOR2X1 U361 ( .A(y2[1]), .B(now_y[1]), .Y(n392) );
  NAND2X1 U362 ( .A(y2[0]), .B(n267), .Y(n371) );
  CLKINVX1 U363 ( .A(now_y[0]), .Y(n267) );
  XNOR2X1 U364 ( .A(n380), .B(n393), .Y(n388) );
  NOR2X1 U365 ( .A(n377), .B(n358), .Y(n393) );
  XOR2X1 U366 ( .A(n378), .B(n394), .Y(n358) );
  XOR2X1 U367 ( .A(x2[1]), .B(now_x[1]), .Y(n394) );
  CLKINVX1 U368 ( .A(n389), .Y(n377) );
  OAI21XL U369 ( .A0(y2[0]), .A1(n219), .B0(n382), .Y(n389) );
  NAND2X1 U370 ( .A(n352), .B(n349), .Y(n380) );
  OAI21XL U371 ( .A0(now_x[0]), .A1(n217), .B0(n378), .Y(n349) );
  NAND2X1 U372 ( .A(now_x[0]), .B(n217), .Y(n378) );
  XNOR2X1 U373 ( .A(n382), .B(n395), .Y(n352) );
  XOR2X1 U374 ( .A(y3[1]), .B(y2[1]), .Y(n395) );
  NAND2X1 U375 ( .A(y2[0]), .B(n219), .Y(n382) );
  CLKINVX1 U376 ( .A(n256), .Y(n240) );
  NAND2X1 U377 ( .A(n221), .B(n216), .Y(n256) );
  CLKINVX1 U378 ( .A(now_y[2]), .Y(n241) );
endmodule

