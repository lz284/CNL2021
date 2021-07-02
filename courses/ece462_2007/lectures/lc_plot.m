function w=lc_plot(x,Rb,ibs)
%
%lc_plot(x,Rb,ibs) plots the line code according to vector "c" which is the
%output of lc_gen function, which means: x=lc_gen(ibs,tlc,Rb) should be
%found before plotting
%
%ibs: input bit stream

delta=0.001;plot(0:delta:(length(x)-1)*delta,x,'r')
xlabel('Time (t)'),ylabel('X(t)')
axis off
hold on
plot(0:1/Rb:delta*(length(x)-1),zeros(1,length(0:1/Rb:delta*(length(x)-1))),'r.','LineWidth',3)
for i=1:length(ibs)
    text(1/Rb*(i-.5),-.1,int2str(ibs(i)))
end