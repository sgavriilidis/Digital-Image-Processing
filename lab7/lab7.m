%1 - Haar Analysis
%input signal
A = [88 88 89 90 92 94 96 97]
%groupped signal , practically we made a 2d array
Ag = [88 88 ; 89 90 ; 92 94 ; 96 97]
%average of each group//row
M = mean(Ag,2);
%hold the first collumn for the difference
col = Ag(:, 1);
diff = col - M ;%difference
Ahaar = [M' diff']
%2 - Haar Synthesis
%Here we upsample the average values
%Aup=[Ahaar(1) Ahaar(1) Ahaar(2) Ahaar(2) Ahaar(3) Ahaar(3) Ahaar(4) Ahaar(4)]
Aup=[];
 for i=1:4
     Aup = [Aup Ahaar(i) Ahaar(i)];
end  
 Aup
 %reconstruction of the initial signal by using the differences from the
 %averagevalues
 Arec=[(Aup(1)+diff(1)) (Aup(2)-diff(1)) (Aup(3)+diff(2)) (Aup(4)-diff(2)) (Aup(5)+diff(3)) (Aup(6)-diff(3)) (Aup(7)+diff(4)) (Aup(8)-diff(4))]
 %verification of the reconstruction
 isequal(A,Arec)
 
 
 
 
 
 
 
 