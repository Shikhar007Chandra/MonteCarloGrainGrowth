clc; clear; close all;

% Simulation parameters
Nx = 100;
Ny = 100;
Ng = 50;        % initial grain count
J  = 1.0;       % boundary energy
kT = 0.1;       % thermal energy
nMCS = 300;     % total Monte Carlo steps

% Initial microstructure
lat = randi(Ng, Nx, Ny);

% Mean grain area storage
avgA = zeros(nMCS,1);

figure(1);
for mcs = 1:nMCS

    lat = monteCarloStep(lat, J, kT);

    % Grain statistics
    gstat = regionprops(lat, 'Area');
    avgA(mcs) = mean([gstat.Area]);

    % Visualize microstructure occasionally
    if mod(mcs,20) == 0
        imagesc(lat);
        axis equal off;
        title(['MCS = ', num2str(mcs)]);
        colormap(jet);
        drawnow;
    end
end

% Grain growth kinetics
figure(2);
plot(1:nMCS, avgA, 'LineWidth', 2);
xlabel('Monte Carlo Steps (MCS)');
ylabel('Mean Grain Area');
title('Grain Growth Kinetics');
grid on;
