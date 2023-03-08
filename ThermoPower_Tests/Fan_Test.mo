within ThermoPower_Tests;

model Fan_Test
  extends Modelica.Icons.Example;
  // system
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  package Medium = Modelica.Media.Air.SimpleAir;
  // boundaries
  ThermoPower.Gas.SourcePressure sourcePressure(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkPressure sinkPressure(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
    w_fixed = Modelica.Units.Conversions.from_rpm(590), 
    useSupport = false) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(
    duration = 9, 
    height = 0.55, 
    offset = 0.3, 
    startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // units
  ThermoPower.Gas.FanMech fanMech(
    redeclare function flowCharacteristic = flowChar, 
    redeclare package Medium = Medium, 
    bladePos0 = 0.8, 
    dp0 = 6000, 
    n0 = 590, 
    q_single_start = 144, 
    rho0 = 1.23, 
    w0 = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  function flowChar = ThermoPower.Functions.FanCharacteristics.quadraticFlowBlades(
    bladePos_nom = {0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85}, 
    q_nom = [0, 0, 100, 300, 470, 620, 760, 900, 1000, 1100, 1300, 1500;
     70, 125, 310, 470, 640, 820, 1000, 1200, 1400, 1570, 1700, 1900;
     100, 200, 370, 530, 700, 900, 1100, 1300, 1500, 1750, 2000, 2300], 
    H_nom = [3100, 3800, 3700, 3850, 4200, 4350, 4700, 4900, 5300, 5600, 5850, 6200; 
      2000, 3000, 3000, 3000, 3000, 3200, 3200, 3300, 3600, 4200, 5000, 5500; 
      1000, 2000, 2000, 2000, 2000, 1750, 1750, 2000, 2350, 2500, 2850, 3200]);
  // pipes
  ThermoPower.Gas.Flow1DFV pipe(
    redeclare package Medium = Medium, 
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 5, 
    L = 80, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = 101325, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV flow1DFV(
    redeclare package Medium = Medium, 
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 0, 
    L = 0.5, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = 101325, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, fanMech.in_bladePos) annotation(
    Line(points = {{-38, 50}, {-14, 50}, {-14, 18}}, color = {0, 0, 127}));
  connect(constantSpeed.flange, fanMech.MechPort) annotation(
    Line(points = {{40, 10}, {0, 10}, {0, 12}}));
  connect(pipe.outfl, sinkPressure.flange) annotation(
    Line(points = {{40, 50}, {60, 50}}, color = {159, 159, 223}));
  connect(fanMech.outfl, pipe.infl) annotation(
    Line(points = {{-4, 18}, {6, 18}, {6, 50}, {20, 50}}, color = {159, 159, 223}));
  connect(sourcePressure.flange, flow1DFV.infl) annotation(
    Line(points = {{-80, 10}, {-60, 10}}, color = {159, 159, 223}));
  connect(flow1DFV.outfl, fanMech.infl) annotation(
    Line(points = {{-40, 10}, {-30, 10}, {-30, 12}, {-18, 12}}, color = {159, 159, 223}));
  annotation(
    experiment(StopTime = 100));
end Fan_Test;