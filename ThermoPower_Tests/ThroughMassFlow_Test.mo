within ThermoPower_Tests;

model ThroughMassFlow_Test
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
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkMassFlow s1(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.SourcePressure q2(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkPressure s2(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.SourcePressure q3(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkPressure s3(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.SourcePressure q40(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SourcePressure q41(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-90, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkPressure s40(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.SourcePressure q5(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-90, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkPressure s5(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {90, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// components
  ThermoPower.Gas.PressDrop pressDrop(
    redeclare package Medium = Medium, 
    dpnom = 999.9999999999999, 
    wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.ThroughMassFlow throughMassFlow(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.ThroughMassFlow throughMassFlow1(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.ThroughMassFlow throughMassFlow2(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.ThroughMassFlow throughMassFlow3(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.Plenum plenum(
    redeclare package Medium = Medium,
    V = 300,
    pstart = system.p_amb,
    Tstart = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// pipes
  ThermoPower.Gas.Flow1DFV pipe30(
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
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe31(
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
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.Flow1DFV pipe40(
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
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe41(
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
    Placement(visible = true, transformation(origin = {-50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe42(
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
    Placement(visible = true, transformation(origin = {50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.Flow1DFV pipe5(
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
    Placement(visible = true, transformation(origin = {50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(q1.flange, pressDrop.inlet) annotation(
    Line(points = {{-80, 50}, {-20, 50}}, color = {159, 159, 223}));
  connect(pressDrop.outlet, s1.flange) annotation(
    Line(points = {{0, 50}, {80, 50}}, color = {159, 159, 223}));
  connect(q2.flange, throughMassFlow.inlet) annotation(
    Line(points = {{-80, 10}, {-20, 10}}, color = {159, 159, 223}));
  connect(throughMassFlow.outlet, s2.flange) annotation(
    Line(points = {{0, 10}, {80, 10}}, color = {159, 159, 223}));
  connect(q3.flange, pipe30.infl) annotation(
    Line(points = {{-80, -30}, {-60, -30}}, color = {159, 159, 223}));
  connect(pipe30.outfl, throughMassFlow1.inlet) annotation(
    Line(points = {{-40, -30}, {-20, -30}}, color = {159, 159, 223}));
  connect(throughMassFlow1.outlet, pipe31.infl) annotation(
    Line(points = {{0, -30}, {40, -30}}, color = {159, 159, 223}));
  connect(pipe31.outfl, s3.flange) annotation(
    Line(points = {{60, -30}, {80, -30}}, color = {159, 159, 223}));
  connect(q40.flange, pipe40.infl) annotation(
    Line(points = {{-80, -70}, {-60, -70}}, color = {159, 159, 223}));
  connect(pipe40.outfl, throughMassFlow2.inlet) annotation(
    Line(points = {{-40, -70}, {-20, -70}}, color = {159, 159, 223}));
  connect(q41.flange, pipe41.infl) annotation(
    Line(points = {{-80, -110}, {-60, -110}}, color = {159, 159, 223}));
  connect(pipe41.outfl, throughMassFlow2.inlet) annotation(
    Line(points = {{-40, -110}, {-30, -110}, {-30, -70}, {-20, -70}}, color = {159, 159, 223}));
  connect(throughMassFlow2.outlet, pipe42.infl) annotation(
    Line(points = {{0, -70}, {40, -70}}, color = {159, 159, 223}));
  connect(pipe42.outfl, s40.flange) annotation(
    Line(points = {{60, -70}, {80, -70}}, color = {159, 159, 223}));
  connect(q5.flange, plenum.inlet) annotation(
    Line(points = {{-80, -150}, {-60, -150}}, color = {159, 159, 223}));
  connect(plenum.outlet, throughMassFlow3.inlet) annotation(
    Line(points = {{-40, -150}, {-20, -150}}, color = {159, 159, 223}));
  connect(throughMassFlow3.outlet, pipe5.infl) annotation(
    Line(points = {{0, -150}, {40, -150}}, color = {159, 159, 223}));
  connect(pipe5.outfl, s5.flange) annotation(
    Line(points = {{60, -150}, {80, -150}}, color = {159, 159, 223}));
  annotation(experiment(StopTime = 30),
    Documentation(info="<html>
This model tests the <tt>ThroughMassFlow</tt> model in connection with different componentes. If ThroughMassFlow is connected directly with a plenum no underpressure is created in the plenum. When connected to a Flow1DFV there is underpressure in the plenum
</html>"),
    Diagram(coordinateSystem(extent = {{-100, -160}, {100, 100}})));
end ThroughMassFlow_Test;