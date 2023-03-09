within ThermoPower_Tests;

model TankSuction_Test
  extends Modelica.Icons.Example;
// def
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Air.SimpleAir;

// boundaries
  ThermoPower.Gas.SourcePressure q1(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkPressure s1(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.SourcePressure q2(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkPressure s2(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// components
  ThermoPower.Gas.ThroughMassFlow throughMassFlow1(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.Plenum tank1(
    redeclare package Medium = Medium,
    V = 300,
    pstart = system.p_amb,
    Tstart = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.ThroughMassFlow throughMassFlow(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.Flow1DFV tank2( //pipe anstelle von plenum als tank
    redeclare package Medium = Medium,
    A = 60, 
    Dhyd = 2*4.37, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 0, 
    L = 5, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

// pipes
  ThermoPower.Gas.Flow1DFV pipe12(
    redeclare package Medium = Medium, 
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 5, 
    L = 80, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe10(
    redeclare package Medium = Medium,
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 5, 
    L = 80, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe11(
    redeclare package Medium = Medium,
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 5, 
    L = 80, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.Flow1DFV pipe20(
    redeclare package Medium = Medium,
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 5, 
    L = 80, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe21(
    redeclare package Medium = Medium,
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 5, 
    L = 80, 
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe22(
    redeclare package Medium = Medium,
    A = 0.0707, 
    Dhyd = 0.3, 
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 5, L = 80,     
    allowFlowReversal = false, 
    dpnom = 2000, 
    omega = 0.2, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 0.5441666666666667) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(throughMassFlow1.outlet, pipe12.infl) annotation(
    Line(points = {{20, 10}, {40, 10}}, color = {159, 159, 223}));
  connect(pipe12.outfl, s1.flange) annotation(
    Line(points = {{60, 10}, {80, 10}}, color = {159, 159, 223}));
  connect(q1.flange, pipe10.infl) annotation(
    Line(points = {{-140, 10}, {-120, 10}}, color = {159, 159, 223}));
  connect(pipe10.outfl, tank1.inlet) annotation(
    Line(points = {{-100, 10}, {-82, 10}}, color = {159, 159, 223}));
  connect(tank1.outlet, pipe11.infl) annotation(
    Line(points = {{-62, 10}, {-40, 10}}, color = {159, 159, 223}));
  connect(pipe11.outfl, throughMassFlow1.inlet) annotation(
    Line(points = {{-20, 10}, {0, 10}}, color = {159, 159, 223}));
  connect(q2.flange, pipe20.infl) annotation(
    Line(points = {{-140, -70}, {-120, -70}}, color = {159, 159, 223}));
  connect(pipe20.outfl, tank2.infl) annotation(
    Line(points = {{-100, -70}, {-70, -70}, {-70, -60}}, color = {159, 159, 223}));
  connect(tank2.outfl, pipe21.infl) annotation(
    Line(points = {{-70, -40}, {-70, -30}, {-40, -30}}, color = {159, 159, 223}));
  connect(pipe21.outfl, throughMassFlow.inlet) annotation(
    Line(points = {{-20, -30}, {0, -30}}, color = {159, 159, 223}));
  connect(throughMassFlow.outlet, pipe22.infl) annotation(
    Line(points = {{20, -30}, {40, -30}}, color = {159, 159, 223}));
  connect(pipe22.outfl, s2.flange) annotation(
    Line(points = {{60, -30}, {80, -30}}, color = {159, 159, 223}));
  annotation(experiment(StopTime = 500),
    Documentation(info="<html>
This model tests the <tt>Plenum</tt> model and <tt>Flow1DFV</tt>. as a mock-up for a 300m3 tank. 
<p>Simulate for 500 s and compare the inlet pressure of tank1 (=Plenum) and tank2 (=Flow1DFV). At the end of simulation tame tank1 has a approx. 86mbar higher inlet pressure than tank2 despite having the same surrounding environment. The Plenum model therefore is no capable for explore pressure loss in a tank.
</html>"),
    Diagram(coordinateSystem(extent = {{-160, -100}, {100, 100}})));


end TankSuction_Test;