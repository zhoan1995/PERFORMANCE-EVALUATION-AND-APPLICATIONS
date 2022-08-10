clear
clc

seed = 0;
N = 10000;
K = 50 ;
M = floor(N/K);
d = 1.96; % 95% confidence
rnd = rand;
p_1 = .5;
l_1 = 0.1;
l_2 = 0.05;
inter_arrivals = zeros(K,M);


    

for i=1:K
    for j = 1:M
        u_1 = rand;
        u_2 = rand ;
        if u_1 >= p_1
            inter_arrivals(i,j) = -log(1-u_2) / l_2;
        else
            inter_arrivals(i,j) = -log(1-u_2) / l_1;
        end
    end
end


avrage = mean(inter_arrivals,1);
l_1 = 0.1;
l_2 = 0.5;
service_time = zeros(K,M);
for j=1:K
    for i =1:M
        u_1 = rand;
        u_2 = rand ;
        service_time (j,i) = eci(l_1,u_1) + eci(l_2,u_2);
        
    end
end



for j=1:K
    job_list = zeros(K,M);
    for i = 1:M
        
        job_arrived = sum(inter_arrivals(j,1:i));
        
        if i ==1
            job_before_completed = 0;
        else
            job_before_completed = completed(j,i-1);
        end
                job_completed = max([job_before_completed,job_arrived]) + service_time(j,i)  ;
        
        arrived (j,i) = job_arrived;
        completed (j,i) = job_completed;
        response_time(j,i) = job_completed-job_arrived;
    end
end

calc_time = zeros(K,1);
%% Average Number of Jobs
for j= 1:K

    calc_time(j) = ct(completed(j,:), arrived(j,:));

end

N_values = sum(response_time,2)./calc_time;

N_mean = mean(N_values);
N_var = var(N_values);

avg_job= [ N_mean - d*sqrt(N_var/K), N_mean + d*sqrt(N_var/K)]
%% Utilization
U_value = sum(service_time,2)./calc_time;
U_mean = mean(U_value);
U_var = var(U_value);
util_job = [ U_mean - d*sqrt(U_var/K), U_mean + d*sqrt(U_var/K)]
%% Throughput
X_value = M./calc_time;

X_mean = mean(X_value);
X_var = var(X_value);
throughput_job = [ X_mean - d*sqrt(X_var/K), X_mean + d*sqrt(X_var/K)]

%% Average Response Time
R_value = sum(response_time,2)./M;

R_mean = mean(R_value);
R_var = var(R_value);
avg_respone_job = [ R_mean - d*sqrt(R_var/K), R_mean + d*sqrt(R_var/K)]


%%  Functions
function calc_time = ct(completed, arrived)

calc_time = completed(end - 1) - arrived(1);
end

function exp_cdf_inv= eci(arrival_rate,y)


exp_cdf_inv = - log(1-y) / arrival_rate;
end

