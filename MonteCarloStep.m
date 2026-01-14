function lat = monteCarloStep(lat, J, kT)
% One Monte Carlo step (MCS) for 2D grain growth
% Potts model with Metropolis criterion

[Nx, Ny] = size(lat);
MCS = Nx * Ny;

for m = 1:MCS

    % Random site
    i = randi(Nx);
    j = randi(Ny);

    % Periodic boundaries
    ip = mod(i, Nx) + 1;
    im = mod(i-2, Nx) + 1;
    jp = mod(j, Ny) + 1;
    jm = mod(j-2, Ny) + 1;

    % Nearest neighbors
    nbrs = [lat(ip,j), lat(im,j), lat(i,jp), lat(i,jm)];

    s0 = lat(i,j);
    s1 = nbrs(randi(4));

    if s0 == s1
        continue;
    end

    % Local energy change
    E0 = J * sum(nbrs ~= s0);
    E1 = J * sum(nbrs ~= s1);
    dE = E1 - E0;

    % Metropolis acceptance
    if dE <= 0 || rand < exp(-dE / kT)
        lat(i,j) = s1;
    end

end

end
