%--------------------------------------------------------------------------
% Project: Hybrid Feedback Control book
% Description: Throw-catch control for obstacle avoidance
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: run.m
% Set of simulation files created and edited by 
% Masoumeh Ghanbanpour and Ricardo Sanfelice
%--------------------------------------------------------------------------
close all
clear all

%% Parameters

global z_s z_h nu rho_s T_s_11 T_s

% Target location
z_s = [0;0];

% Intermediate location
z_h = [-2;7];

% Radius around z_s which measurement is available
rho_s = 2;

% initial point x = [z,q,tau], 
% z: position of vehicle,
% q: mode
% tau: timer
x0 = [-10;10;0;0];

% open loop control law
nu = (z_s - z_h);

% worst case travel time from S_11 to E_01:(|z_s - z_h | + 3/4 rho_s)/|nu|
T_s_11 = (norm(z_s - z_h) + 3/4 * rho_s)/norm(nu);

% max time 
T_s = T_s_11 + 2;

% simulation horizon
TSPAN=[0 10];
JSPAN = [0 20];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

%% Main part

options = odeset('RelTol',1e-6,'MaxStep',.1);

% simulate
[t,j,x] = HyEQsolver( @f_ex6_9,@g_ex6_9,@C_ex6_9,@D_ex6_9,...
                      x0,TSPAN,JSPAN,rule,options,'ode23t');

%% PLot
plot_figs;