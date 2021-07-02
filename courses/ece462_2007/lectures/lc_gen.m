function w=lc_gen(ibs,tlc,Rb);
%
% lc_gen(ibs,tlc,Rb) generates different line codes according to the input
% bit stream which arrive with bit rate Rb
%
% ibs: Input bit stream
%
% tlc: Type of line code:
% NRZ-L, NRZ-M, NRZ-S, __AMI, ___RZ, BI_RZ, MANCH, D_MAN
% Note that they all are the same length (5)
%
% Rb: bit rate
delta=.001; %Time resolution
T=length(ibs)/Rb; %The length of time for input bit stream
time=0:delta:T;
PointPerBit=1/Rb/delta;
w=zeros(1,length(time));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if tlc=='NRZ-L'
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs(fix(t/PointPerBit)+1);
    end
    w(k+1)=ibs(fix(t/PointPerBit)+1);
end
if tlc=='NRZ-M'
    ibs_nrzm(1)=ibs(1);
    for i=2:length(ibs)
        if ibs(i)==1
            ibs_nrzm(i)=~ibs_nrzm(i-1);
        else
            ibs_nrzm(i)=ibs_nrzm(i-1);
        end
    end
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs_nrzm(fix(t/PointPerBit)+1);
    end
    w(k+1)=ibs_nrzm(fix(t/PointPerBit)+1);
end
if tlc=='NRZ-S'
    ibs_nrzs(1)=~ibs(1);
    for i=2:length(ibs)
        if ibs(i)==1
            ibs_nrzs(i)=ibs_nrzs(i-1);
        else
            ibs_nrzs(i)=~ibs_nrzs(i-1);
        end
    end
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs_nrzs(fix(t/PointPerBit)+1);
    end
    w(k+1)=ibs_nrzs(fix(t/PointPerBit)+1);
end
if tlc=='__AMI'
    ibs_ami(find(ibs==0))=0;
    ll=fix(length(find(ibs))/2);
    xx=[];
    for i=1:ll
        xx=[xx 1 -1];
    end
    if 2*ll~=length(find(ibs))
        xx=[xx -xx(length(xx))];
    end
    ibs_ami(find(ibs))=xx;
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs_ami(fix(t/PointPerBit)+1);
    end
    w(k+1)=ibs_ami(fix(t/PointPerBit)+1);
end
if tlc=='___RZ'
    ibs_rz=[];
    for i=1:length(ibs)
        if ibs(i)==0
            ibs_rz=[ibs_rz 0 0];
        else
            ibs_rz=[ibs_rz 1 0];
        end
    end
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs_rz(fix(t/(PointPerBit/2))+1);
    end
    w(k+1)=ibs_rz(fix(t/(PointPerBit/2))+1);
end
if tlc=='BI_RZ'
    ibs_brz=[];count=-1;
    for i=1:length(ibs)
        if ibs(i)==0
            ibs_brz=[ibs_brz 0 0];
        else
            count=count+1; 
            ibs_brz=[ibs_brz (-1)^count 0];
        end
    end
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs_brz(fix(t/(PointPerBit/2))+1);
    end
    w(k+1)=ibs_brz(fix(t/(PointPerBit/2))+1);
end
if tlc=='MANCH'
    ibs_bph=[];
    for i=1:length(ibs)
        if ibs(i)==0
            ibs_bph=[ibs_bph 1 0];
        else
            ibs_bph=[ibs_bph 0 1];
        end
    end
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs_bph(fix(t/(PointPerBit/2))+1);
    end
    w(k+1)=ibs_bph(fix(t/(PointPerBit/2))+1);
end
if tlc=='D_MAN'
    ibs_dm=[];
    if ibs(1)==0
        ibs_dm=[1 0];
    else
        ibs_dm=[0 1];
    end
    for i=2:length(ibs)
        if ibs(i)==0
            ibs_dm=[ibs_dm ~ibs_dm(length(ibs_dm)-1) ibs_dm(length(ibs_dm)-1)];
        else
            ibs_dm=[ibs_dm ibs_dm(length(ibs_dm)-1) ~ibs_dm(length(ibs_dm)-1)];
        end
    end
    k=0;
    for t=setdiff(time,T)/delta
        k=k+1;
        w(k)=ibs_dm(fix(t/(PointPerBit/2))+1);
    end
    w(k+1)=ibs_dm(fix(t/(PointPerBit/2))+1);
end