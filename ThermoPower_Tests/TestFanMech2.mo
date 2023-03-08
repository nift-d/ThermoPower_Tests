within ThermoPower_Tests;

model TestFanMech2
  extends Modelica.Icons.Example;
// system
  inner ThermoPower.System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  package Medium = Modelica.Media.Air.SimpleAir;
// boundaries
  ThermoPower.Gas.SinkPressure SinkP1(redeclare package Medium = Medium) annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation=
            0)));
  ThermoPower.Gas.SourcePressure SourceP1(redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-98,-10},{-78,10}}, rotation=0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed ConstantSpeed1(
      w_fixed=Modelica.Units.Conversions.from_rpm(590), 
      useSupport=false) annotation (Placement(transformation(extent={{90,-10},{70,10}},
          rotation=0)));

  Modelica.Blocks.Sources.Ramp Ramp1(
    startTime=1,
    height=0.55,
    duration=9,
    offset=0.30) annotation (Placement(transformation(extent={{-100,40},{-80,
            60}}, rotation=0)));

// units
  ThermoPower.Gas.FanMech FanMech1(
    redeclare function flowCharacteristic = flowChar,
    redeclare package Medium = Medium,
    rho0=1.23,
    n0=590,
    bladePos0=0.8,
    q_single_start=144,
    w0=144,
    dp0=6000) annotation (Placement(transformation(extent={{-70,-24},{-30,16}}, rotation=0)));

  function flowChar = ThermoPower.Functions.FanCharacteristics.quadraticFlowBlades (
      bladePos_nom={0.30,0.35,0.40,0.45,0.50,0.55,0.60,0.65,0.70,0.75,0.80, 0.85},
      q_nom=[0, 0, 100, 300, 470, 620, 760, 900, 1000, 1100, 1300, 1500; 
            70, 125, 310, 470, 640, 820, 1000, 1200, 1400, 1570, 1700, 1900; 
            100, 200, 370, 530, 700, 900, 1100, 1300, 1500, 1750, 2000, 2300],
      H_nom=[3100, 3800, 3700, 3850, 4200, 4350, 4700, 4900, 5300, 5600, 5850, 6200; 
            2000, 3000, 3000, 3000, 3000, 3200, 3200, 3300, 3600, 4200, 5000, 5500; 
            1000, 2000, 2000, 2000, 2000, 1750, 1750, 2000, 2350, 2500, 2850, 3200]);

  ThermoPower.Gas.PressDrop PressDrop1(
    redeclare package Medium = Modelica.Media.Air.SimpleAir,
    wnom=2000*1.229,
    FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
    rhonom=1.229,
    dpnom=6000) annotation (Placement(transformation(extent={{-30,20},{-10,40}}, rotation=0)));
/*
  Modelica.Mechanics.Rotational.Components.Clutch Clutch1(
    fn_max=1e6,
    phi_rel(fixed=true),
    w_rel(fixed=true))
    annotation (Placement(transformation(extent={{30,-10},{50,10}},
          rotation=0)));

  Modelica.Mechanics.Rotational.Components.Inertia Inertia1(
    w(start = Modelica.Units.Conversions.from_rpm(590)), 
    J=10000,
    phi(fixed=true, start=0))annotation (
     Placement(transformation(extent={{-20,-10},{0,10}}, rotation=0)));
     
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
*/
equation
  connect(SourceP1.flange, FanMech1.infl) annotation(
    Line(points = {{-78, 0}, {-78, 0.4}, {-66, 0.4}}, color = {159, 159, 223}, thickness = 0.5));
  connect(Ramp1.y, FanMech1.in_bladePos) annotation(
    Line(points = {{-79, 50}, {-58, 50}, {-58, 11.2}}, color = {0, 0, 127}));
  connect(PressDrop1.outlet, SinkP1.flange) annotation(
    Line(points = {{-10, 30}, {0, 30}}, color = {159, 159, 223}, thickness = 0.5));
  connect(FanMech1.outfl, PressDrop1.inlet) annotation(
    Line(points = {{-38, 10.4}, {-40.4, 10.4}, {-40.4, 30}, {-30, 30}}, color = {159, 159, 223}, thickness = 0.5));
/*
  connect(FanMech1.MechPort, Inertia1.flange_a) annotation(
    Line(points = {{-31.4, 0.2}, {-26.425, 0.2}, {-26.425, 0}, {-20, 0}}, color = {0, 0, 0}, thickness = 0.5));
  connect(Inertia1.flange_b, Clutch1.flange_a) annotation(
    Line(points = {{0, 0}, {30, 0}}, color = {0, 0, 0}, thickness = 0.5));
  connect(Clutch1.flange_b, ConstantSpeed1.flange) annotation(
    Line(points = {{50, 0}, {70, 0}}, color = {0, 0, 0}, thickness = 0.5));
  connect(const.y, Clutch1.f_normalized) annotation(
    Line(points = {{2, 70}, {40, 70}, {40, 12}}, color = {0, 0, 127}));
*/
  connect(ConstantSpeed1.flange, FanMech1.MechPort) annotation(
    Line(points = {{70, 0}, {-32, 0}}));
  annotation (
    Diagram(graphics),
    experiment(StopTime=13, Algorithm="Dassl"),
    experimentSetupOutput(equdistant=true));
end TestFanMech2;