% Fig. 4: max_C (1/6) sum_U Tr(Omega_U C), U in {X,Y,Z,I,H,S}.
% Requires CVX and QETLAB on the MATLAB path.

%% Gates, noise values and physical ports
gates = {[0,1;1,0], [0,-1i;1i,0], [1,0;0,-1], eye(2), ...
    [1,1;1,-1]/sqrt(2), diag([1,1i])};
gammas = 0.20:0.02:0.80;
classes = {'Par','Seq','ICO'};
P = 1; I1 = 2; O1 = 3; I2 = 4; O2 = 5; F = 6;
dims = 2*ones(1,6);                       % P,I1,O1,I2,O2,F
summary_rows = cell(0,9);
gate_rows = cell(0,9);
Copt = cell(numel(gammas),3);

for g = 1:numel(gammas)
    gamma = gammas(g);

    %% Omega = (1/6) sum_U Omega_U
    Omega_U = zeros(64,64,6);
    for u = 1:6
        U = gates{u};
        JU = U(:)*U(:)';                 % |U>><<U|
        Jnoisy = (1-gamma)*JU + gamma*eye(4)/2;
        % Start with I1,O1,I2,O2,P,F; restore P,I1,O1,I2,O2,F.
        % .' is the ordinary transpose used in the link-product fidelity.
        Omega_U(:,:,u) = PermuteSystems( ...
            kron(kron(Jnoisy.',Jnoisy.'),JU), [5,1,2,3,4,6], dims)/4;
    end
    Omega = mean(Omega_U,3);

    for s = 1:numel(classes)
        strategy = classes{s};

        %% Maximize Tr(Omega C) subject to the physical strategy constraints
        cvx_begin sdp quiet
            cvx_solver sdpt3
            cvx_precision([1e-10,1e-8,1e-6]);
            variable C(64,64) hermitian semidefinite
            dual variable y_trace           % ask CVX to return its dual bound
            maximize(real(trace(Omega*C)))
            subject to
                y_trace : trace(C) == 8;
                R(C,[I1,O1,I2,O2,F]) == R(C,[P,I1,O1,I2,O2,F]);

                if strcmp(strategy,'Par')
                    R(C,F) == R(C,[O1,O2,F]);
                elseif strcmp(strategy,'Seq')
                    R(C,F) == R(C,[O2,F]);
                    R(C,[I2,O2,F]) == R(C,[O1,I2,O2,F]);
                else                         % ICO: the three nonempty slot subsets
                    R(C,F) + R(C,[O1,O2,F]) == R(C,[O1,F]) + R(C,[O2,F]);
                    R(C,[I2,O2,F]) == R(C,[O1,I2,O2,F]);
                    R(C,[I1,O1,F]) == R(C,[I1,O1,O2,F]);
                end
        cvx_end
        assert(strcmp(cvx_status,'Solved'), 'SDP status: %s', cvx_status);

        %% Evaluate the six gate fidelities with the same optimized C
        fidelity = real(trace(Omega*C));
        f = zeros(1,6);
        for u = 1:6
            f(u) = real(trace(Omega_U(:,:,u)*C));
        end
        baseline = 1-3*gamma/4;
        gap = abs(cvx_optbnd-cvx_optval);
        summary_rows(end+1,:) = {gamma,strategy,fidelity,baseline,cvx_status, ...
            cvx_optval,cvx_optbnd,cvx_slvtol,gap};
        gate_rows(end+1,:) = [{gamma,strategy,baseline},num2cell(f)];
        Copt{g,s} = C;
        fprintf('gamma=%.2f  %s  F=%.12f  gap=%.2e  %s\n', ...
            gamma,strategy,fidelity,gap,cvx_status);
    end
end

%% Save the curves, per-gate values and optimized strategies
summary = cell2table(summary_rows,'VariableNames', ...
    {'gamma','class','fidelity','baseline','status','cvx_optval','cvx_optbnd', ...
     'cvx_slvtol','duality_gap'});
per_gate = cell2table(gate_rows,'VariableNames', ...
    {'gamma','class','baseline','f_X','f_Y','f_Z','f_I','f_H','f_S'});
out = fullfile(fileparts(mfilename('fullpath')),'recomputed');
if ~exist(out,'dir'), mkdir(out); end
writetable(summary,fullfile(out,'summary.csv'));
writetable(per_gate,fullfile(out,'per_gate_fidelities.csv'));
save(fullfile(out,'results.mat'),'gammas','classes','Copt','summary','per_gate');

%% Plot Figure 4 (this section can also run alone, without CVX or QETLAB)
% Use the new solve if present; otherwise use the bundled samples.
root = fileparts(mfilename('fullpath'));
data_file = fullfile(root,'recomputed','summary.csv');
if ~isfile(data_file)
    data_file = fullfile(root,'summary.csv');
end
data = readtable(data_file,'TextType','string');
classes = {'ICO','Seq','Par'};
labels = {'Indefinite causal order strategy','Sequential strategy','Parallel strategy'};
colors = [31,119,180;255,127,14;44,160,44]/255;

fig = figure('Visible','off','Color','white','Position',[100,100,1062,801]);
ax = axes(fig,'Position',[0.10,0.12,0.865,0.845]);
zoom_ax = axes(fig,'Position',[0.5844,0.5890,0.3028,0.2958]);
hold(ax,'on'); hold(zoom_ax,'on');
for k = 1:3
    rows = data(data.class == classes{k} & data.gamma >= 0.2-1e-12 ...
        & data.gamma <= 0.8+1e-12,:);
    rows = sortrows(rows,'gamma');
    plot(ax,rows.gamma,rows.fidelity,'Color',colors(k,:), ...
        'LineWidth',1.6,'DisplayName',labels{k});
    plot(zoom_ax,rows.gamma,rows.fidelity,'Color',colors(k,:),'LineWidth',1.4);
end
set(ax,'XLim',[0.2,0.8],'YLim',[0.4,1.0],'XTick',0.2:0.1:0.8, ...
    'YTick',0.4:0.1:1.0,'FontSize',17,'Box','on');
xlabel(ax,'\gamma','FontSize',20); ylabel(ax,'average fidelity','FontSize',20);
grid(ax,'on'); ax.GridAlpha = 0.25;
legend(ax,'Location','southwest','FontSize',15);
set(zoom_ax,'XLim',[0.4,0.5],'YLim',[0.65,0.74],'XTick',0.4:0.02:0.5, ...
    'YTick',0.66:0.02:0.74,'FontSize',13,'Box','on');
grid(zoom_ax,'on'); zoom_ax.GridAlpha = 0.25;

out = fullfile(root,'matlab_plot');
if ~exist(out,'dir'), mkdir(out); end
exportgraphics(fig,fullfile(out,'figure4_matlab.png'),'Resolution',200);
exportgraphics(fig,fullfile(out,'figure4_matlab.pdf'),'ContentType','vector');
close(fig);

%% Normalized trace-and-replace operation
function Y = R(C,sys)
% R(C,sys) = normalized trace-and-replace: (I_sys/d_sys) tensor Tr_sys(C).
    dims = 2*ones(1,6);
    sys = sort(sys);
    keep = setdiff(1:6,sys,'stable');
    Y = kron(PartialTrace(C,sys,dims,0),eye(2^numel(sys))/2^numel(sys));
    [~,order] = sort([keep,sys]);          % restore the original port order
    Y = PermuteSystems(Y,order,dims);
end
