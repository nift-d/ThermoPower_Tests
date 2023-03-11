within ThermoPower_Tests;

model Flow1DFV_Test
// def
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable package Medium = Modelica.Media.Air.SimpleAir;
  parameter Modelica.Units.SI.Length roughness=1.5e-4; // default = 0.15mm -> 1,5e-4m

// boundaries
  ThermoPower.Gas.SourcePressure sourcePressure1(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkMassFlow sinkMassFlow1(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  ThermoPower.Gas.SourcePressure sourcePressure2(
    redeclare package Medium = Medium,
    p0 = system.p_amb,
    T = system.T_amb) annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.SinkMassFlow sinkMassFlow2(
    redeclare package Medium = Medium,
    w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// pipes
  ThermoPower.Gas.Flow1DFV pipe1(//FFtype = OpPoint
    redeclare package Medium = Medium, 
    A = 0.0707, 
    //A = 0.0079,
    Dhyd = 0.3,
    //Dhyd = 0.1,
    e = roughness/pipe2.Dhyd,
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.OpPoint, 
    H = 0, 
    L = 80, 
    dpnom = 400, 
    pstart = system.p_amb, 
    rhonom = 1.2922, 
    wnom = 1)     annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Gas.Flow1DFV pipe2(//FFtype = Colebrook
    redeclare package Medium = Medium, 
    A = 0.0707, 
    Dhyd = 0.3, 
    e = roughness/pipe2.Dhyd,
    FFtype = ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
    H = 0, 
    L = 80, 
    dpnom = 400, 
    pstart = system.p_amb, 
    wnom = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(sourcePressure1.flange, pipe1.infl) annotation(
    Line(points = {{-80, 30}, {-20, 30}}, color = {159, 159, 223}));
  connect(pipe1.outfl, sinkMassFlow1.flange) annotation(
    Line(points = {{0, 30}, {80, 30}}, color = {159, 159, 223}));
  connect(sourcePressure2.flange, pipe2.infl) annotation(
    Line(points = {{-80, -10}, {-20, -10}}, color = {159, 159, 223}));
  connect(pipe2.outfl, sinkMassFlow2.flange) annotation(
    Line(points = {{0, -10}, {80, -10}}, color = {159, 159, 223}));
  annotation(experiment(StopTime = 10),
    Documentation(info="<html>
This model tests two different <tt>FFtypes</tt> of <tt>Flow1DFV</tt> 
The model features five different FFtypes:
<ul>
<li><tt>FFtype = FFtypes.Kfnom</tt>: the hydraulic friction coefficient <tt>Kf</tt> is set directly to <tt>Kfnom</tt>.
<li><tt>FFtype = FFtypes.OpPoint</tt>: the hydraulic friction coefficient is specified by a nominal operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom</tt>).
<li><tt>FFtype = FFtypes.Cfnom</tt>: the friction coefficient is computed by giving the (constant) value of the Fanning friction factor <tt>Cfnom</tt>.
<li><tt>FFtype = FFtypes.Colebrook</tt>: the Fanning friction factor is computed by Colebrook's equation (assuming Re > 2100, e.g. turbulent flow).
<li><tt>FFtype = FFtypes.NoFriction</tt>: no friction is assumed across the pipe.
</ul>

Those FFtypes are used:
<ul>
<li><tt>FFtype = FFtypes.Kfnom</tt>: not used, <tt>Kfnom</tt> is normally unknown
<li><tt>FFtype = FFtypes.OpPoint</tt>: used, because the nominal operating point must be known, but it can change.
<li><tt>FFtype = FFtypes.Cfnom</tt>: not used, <tt>Cfnom</tt> is normally unknown 
<li><tt>FFtype = FFtypes.Colebrook</tt>: used, because it can adopt to change in flux and hydraulic parameters of pipe can remain unknown
<li><tt>FFtype = FFtypes.NoFriction</tt>: no point in testing that
</ul>

Results:
<ul>
<li><tt>FFtype = FFtypes.OpPoint</tt>: initial value for dpnom sensitively change the pressure drop due to friction. In case of changing flux this FFtype is not usable.
<li><tt>FFtype = FFtypes.Colebrook</tt>: the best FFtype, because only known parameters need to be set and the sensitifity regarding e (ratio roughness/diameter) is manageable.
</ul>
</html>"));
end Flow1DFV_Test;