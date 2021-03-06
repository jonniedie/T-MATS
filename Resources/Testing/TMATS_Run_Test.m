function TMATS_Run_Test()
MWS.Multi.top_level = pwd;

% for steady state tests.
 
% MWS.Multi.Full = [...
% {'Actuator_FO'}...
% {'Ambient'}...
% {'Bleed'}...
% {'Burner'}...
% {'Comp'}...
% {'ControllerPI'}...
% {'CorN'}...
% {'CorW'}...
% {'CorWf'}...
% {'Duct'}...
% {'FlwPthChar'}...
% {'Mixer'}...
% {'Mod_Source'}...
% {'Nozzle'}...
% {'OutLoopInt'}...
% {'pt2s'}...
% {'Sensor_FO'}...
% {'Shaft'}...
% {'Splitter'}...
% {'sp2t'}...
% {'SolverSS'}...
% {'SolverDyn'}...
% {'StaticCalc'}...
% {'t2h'}...
% {'Turbine'}...
% {'Turbine_PSI'}...
% {'Valve'}...
% {'Valve_PHY'}...
% {'VCond'}...
% ];

% MWS.Multi.Full = [...
%     {'Ambient'}...
%     {'Bleed'}...
%     {'Burner'}...
%     {'Comp'}...
%     {'CompVG'}...
%     {'h2t'}...
%     {'Mixer'}...
%     {'Nozzle'}...
%     {'pt2s'}...
%     {'sp2t'}...
%     {'StaticCalc'}...
%     {'t2h'}...
%     {'Turbine'}...
%     {'Turbine_PSI'}...
%     {'Valve'}...
%     {'Valve_PHY'}...
%     ];

MWS.Multi.Full = [...
    {'AmbientSIL'}...
%     {'Bleed'}...
%     {'Burner'}...
%     {'Comp'}...
%     {'CompVG'}...
%     {'h2t'}...
%     {'Mixer'}...
%     {'Nozzle'}...
%     {'pt2s'}...
%     {'sp2t'}...
%     {'StaticCalc'}...
%     {'t2h'}...
%     {'Turbine'}...
%     {'Turbine_PSI'}...
%     {'Valve'}...
%     {'Valve_PHY'}...
    ];


%-------Change MWS.Multi.Tests  to vector of tests to be run. -----------
MWS.Multi.Tests = [...
MWS.Multi.Full
                    ];
                
% Run each test
for i = 1:length(MWS.Multi.Tests)
    MWS.Multi.Temp = [MWS.Multi.top_level '\' MWS.Multi.Tests{i}];
    [MWS,ATOutput] = TMATS_Auto_Test(MWS,MWS.Multi.Tests{i});
    MWS.Multi.Output{i} = ATOutput;
    MWS.Multi.TV{i} = MWS.TV;
end

cd('Output_Data')
% Output Data stored as an NxMxA matrix: Rows N = Time, Col. M = Output
% Data, and Dim. A = successive runs
% Output Data names can be seen in the .slx file in the testbed.
% Definitions for each Run will be given in the TV matrix (also being saved).
Out = MWS.Multi.Output;
TV = MWS.Multi.TV;
% name output multi if there is more then one module otherwise name file
% module name
if 1 == length(MWS.Multi.Tests)
    Temp.name = strcat(MWS.Multi.Tests{1}, '_' ,datestr(now,30), '.mat');
else
    Temp.name = strcat('MT_TestNum_',num2str(length(Out)) ,'_Stmp_',datestr(now,30), '.mat');
end

save(Temp.name,'Out', 'TV')
cd(MWS.Multi.top_level)