%%%%%%%%%%%%%%%%%%
% plot_figs
% input: 
% output: figures

%%%%%%%%%%%%%%%%%%
%% Parameteres
fontsz = 16;
ax_fontsz = 10;
linewd = 1;
% plot solution
figure(1) % position
clf
set(0,'defaulttextinterpreter','latex')
set(0, 'DefaultLineLineWidth', linewd);
subplot(2,1,1), plotHarc(t,j,x(:,1));

title(['Solution from [',num2str(x0(1)),',',num2str(x0(2)),']'],'FontSize', fontsz )
grid on
ylabel('$z_1$','FontSize', fontsz )
subplot(2,1,2), plotHarc(t,j,x(:,2));
grid on
ylabel('$z_2$', 'FontSize', fontsz )

% plot phase plane
figure(2) 
clf
set(0,'defaulttextinterpreter','latex')
set(0, 'DefaultLineLineWidth', linewd);
plotHarcColor(x(:,1),j,x(:,2),t);

title(['Solution from [',num2str(x0(1)),',',num2str(x0(2)),']'],'FontSize', fontsz )
xlabel('$z_1$','FontSize', fontsz )
ylabel('$z_2$','FontSize', fontsz )
grid on

figure(3) 
clf
set(0,'defaulttextinterpreter','latex')
set(0, 'DefaultLineLineWidth', linewd);
subplot(2,1,1), plotHarc(t,j,x(:,3));

title(['Solution from [',num2str(x0(1)),',',num2str(x0(2)),']'],'FontSize', fontsz )
grid on
ylabel('$q$','FontSize', fontsz )
subplot(2,1,2), plotHarc(t,j,x(:,4));
grid on
ylabel('$\tau$','FontSize', fontsz )

%% Complete figure
figure(4)
clf
set(0,'defaulttextinterpreter','latex')
set(0, 'DefaultLineLineWidth', linewd);
subplot(2,2,[1, 3]), plotHarcColor(x(:,1),j,x(:,2),t);
grid on
box on
hold on
circle(z_s(1), z_s(2), 3/4 * rho_s)
hold on
circle(z_h(1), z_h(2), 3/4 * rho_s)
hold on
circle(z_h(1), z_h(2), 1/8 * rho_s)
hold on
set(gca,'FontSize', ax_fontsz)
xlabel('$z_1$','FontSize', fontsz )
ylabel('$z_2$','FontSize', fontsz )
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', fontsz)
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
set(hXLabel, 'FontSize', fontsz)
title('')
axis([min(x(:,1))-rho_s, max(x(:,1))+rho_s, min(x(:,2))-rho_s, max(x(:,2))+rho_s  ])
text( z_s(1)+0.2, z_s(2)-0.2, '$z^*$', 'FontSize', 14 )
text(z_h(1)+0.2, z_h(2)-0.2, '$z^\#$', 'FontSize', 14 )
axis equal

% q
set(0,'defaulttextinterpreter','latex')
set(0, 'DefaultLineLineWidth', linewd);
subplot(2,2,2), plotHarc(t,j,x(:,3));
set(gca,'FontSize', ax_fontsz)
xlabel('$t\ [s]$', 'FontSize', fontsz )
ylabel('$q$',  'FontSize', fontsz )
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', fontsz )
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
set(hXLabel, 'FontSize', fontsz )
title('')
axis([0 TSPAN(2) -0.1 max(x(:,3))+0.1])
grid on

% \tau
set(0,'defaulttextinterpreter','latex')
set(0, 'DefaultLineLineWidth', linewd);
subplot(2,2,4), plotHarc(t,j,x(:,4));
set(gca,'FontSize', ax_fontsz)
xlabel('$t\ [s]$', 'FontSize', fontsz )
ylabel('$\tau$', 'FontSize', fontsz )
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', fontsz )
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
set(hXLabel, 'FontSize', fontsz )
title('')
axis([0 TSPAN(2) -0.1 max(x(:,4))+0.1])
grid on

print -depsc -tiff -r300 PlanarSimulation.eps

