
clc;

% Joint space variables
Th_1 = -pi/4;
d_2 = 1;
d_3 = 1;
Th_4 = -pi/4;
Th_5 = -pi/4;
Th_6 = -pi/4;


% Setting DH parameters for joints
L(1) = Link([0, 2, 0, 0]);      % DH parameters 
L(1).qlim = [0 pi];             % joint limits

L(2) = Link([0, 0, 0, -pi/2]);  % DH parameters 
L(2).sigma = 1;                 % for prismatic joint
L(2).qlim = [0 3];              % joint limits
%L(2).offset = 2;               % joint offset

L(3) = Link([0, 0, 0, 0]);      % DH parameters 
L(3).sigma = 1;                 % for prismatic joint
L(3).qlim = [0 3];              % joint limits
%L(3).offset = 2;               % joint offset

L(4) = Link([0, 0, 0, -pi/2]);  % DH parameters 
L(4).qlim = [0 pi];             % joint limits
L(4).offset = 0;                % joint offset

L(5) = Link([0, 0, 0, pi/2]);   % DH parameters
L(5).qlim = [0 pi];             % joint limits
L(5).offset = 0;                % joint offset

L(6) = Link([0, 2, 0, 0]);      % DH parameters
L(6).qlim = [0 pi];             % joint limits
L(6).offset = 0;                % joint offset



% creating robot object from the links array
Robot = SerialLink(L);
Robot.name = 'R2P3R';


% plotting the robot in specific position
%f = figure();
Robot.plot([Th_1 d_2 d_3 Th_4 Th_5 Th_6],'workspace',[-7 7 -7 7 -3 8]);
hold on;
%movegui(f,'north');

N = 30;
L1 = linspace(-pi/2,pi/2,N);
L2 = linspace(1,5,N);
L3 = linspace(1,5,N);
L4 = linspace(-pi/2,pi/2,N);
L5 = linspace(-pi/2,pi/2,N);
L6 = linspace(-pi/2,pi/2,N);


for x=1:1:N
    Robot.plot([L1(x) L2(x) L3(x) L4(x) L5(x) L6(x)],'workspace',[-7 7 -7 7 -3 8]);
    J = Robot.fkine([L1(x) L2(x) L3(x) L4(x) L5(x) L6(x)]);
    plot3(J(1,4),J(2,4),J(3,4),'r*');
end

L1 = linspace(pi/2,3*pi/2,N);
L2 = linspace(5,1,N);
L3 = linspace(5,1,N);
L4 = linspace(pi/2,-pi/2,N);
L5 = linspace(pi/2,-pi/2,N);
L6 = linspace(pi/2,-pi/2,N);

for x=1:1:N
    Robot.plot([L1(x) L2(x) L3(x) L4(x) L5(x) L6(x)],'workspace',[-7 7 -7 7 -3 8]);
    J = Robot.fkine([L1(x) L2(x) L3(x) L4(x) L5(x) L6(x)]);
    plot3(J(1,4),J(2,4),J(3,4),'r*');
end

clear L1 L2 L3 L4 L5 L6 Th_1 d_2 d_3 Th_4 Th_5 Th_6 J L x N;





