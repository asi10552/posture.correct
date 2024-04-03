A=projectStruct.Subject.Test_008.MarkerData.Raw.HEADMarker1(:,1:3);
B=projectStruct.Subject.Test_008.MarkerData.Raw.HEADMarker2(:,1:3);
C=projectStruct.Subject.Test_008.MarkerData.Raw.HEADMarker3(:,1:3);

D= projectStruct.Subject.Test_008.MarkerData.Raw.UPBACKMarker1(:,1:3);
E=projectStruct.Subject.Test_008.MarkerData.Raw.UPBACKMarker2(:,1:3);
F=projectStruct.Subject.Test_008.MarkerData.Raw.UPBACKMarker3(:,1:3);

G= projectStruct.Subject.Test_008.MarkerData.Raw.LOWBACKMarker1(:,1:3);
H=projectStruct.Subject.Test_008.MarkerData.Raw.LOWBACKMarker2(:,1:3);
I=projectStruct.Subject.Test_008.MarkerData.Raw.LOWBACKMarker3(:,1:3);
%create a matrix to store the normal vectors
nRows=size(A, 1); %counts the rows in nodeA
normalVectorsABC = zeros(nRows, 3); %Creates a number of zeros = to row count, 3 width
normalVectorsDEF = zeros(nRows, 3);
dihedralAngles= zeros(nRows,2);

for i = 1:nRows
    %Defines the points at this state of time
     pointA= A(i, :);
     pointB= B(i, :);
     pointC= C(i, :);
     pointD= D(i, :);
     pointE= E(i, :);
     pointF= F(i, :);
     pointG= G(i, :);
     pointH= H(i, :);
     pointI= I(i, :);
     
     vectorAB = pointB-pointA;
     vectorAC= pointC-pointA;
     normalVectorABC = cross(vectorAB, vectorAC);
     
     vectorDE = pointE-pointD;
     vectorDF= pointF-pointD;
     normalVectorDEF = cross(vectorDE, vectorDF);
     
     vectorGH= pointH-pointG;
     vectorGI= pointI-pointG;
     normalVectorGHI = cross(vectorGH, vectorGI);
     
     %Angle head/neck
     dihedralAngles(i,1) = acos(dot(normalVectorABC,normalVectorDEF)/(norm(normalVectorABC)*norm(normalVectorDEF)));
     %Angle Neck/Lumbar
     dihedralAngles(i,2) = acos(dot(normalVectorGHI,normalVectorDEF)/(norm(normalVectorGHI)*norm(normalVectorDEF)));
end
disp('NeckAngle:Back Angle');
disp(dihedralAngles(:,:));
