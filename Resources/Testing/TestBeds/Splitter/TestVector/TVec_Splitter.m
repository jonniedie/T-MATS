function MWS = TVec_Splitter(MWS)
%		TMATS -- setup_Splitter.m
% *************************************************************************
% written by Jeffryes Chapman 
% NASA Glenn Research Center, Cleveland, OH
% Dec 18th, 2012
%
% This function creates the properties of the Splitter component.
% *************************************************************************


MWS.TV.VarNames = {'Splitter' 'W' 'FARc' 'Tt' 'Pt' 'BPR'};

WIn = [102 104];
FARcIn = 0.03;
TtIn = 2449.02;
PtIn = 99;
BPR = .2;


a = 1;
for i1 = 1:length(WIn)
    for i2 = 1:length(FARcIn)
        for i3 = 1:length(TtIn)
            for i4 = 1:length(PtIn)
                for i5 = 1:length(BPR)
                    MWS.TV.TV(1,a) = WIn(i1);
                    MWS.TV.TV(2,a) = FARcIn(i2);
                    MWS.TV.TV(3,a) = TtIn(i3);
                    MWS.TV.TV(4,a) = PtIn(i4);
                    MWS.TV.TV(5,a) = BPR(i5);
                    a = a + 1;
                end
            end
        end
    end
end




