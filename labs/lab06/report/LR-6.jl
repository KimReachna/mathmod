1032205204%70+1

using Plots
using DifferentialEquations

a = 0.02
b = 0.007

N = 6666
I = 83
R = 6
S = N-I-R

u0 = [S; I; R]
t = collect(LinRange(0, 300, 1000))
tspan = (0, 300)

function syst(dy, y, p, t)
    dy[1] = 0;
    dy[2] = b*y[2];
    dy[3] = -b*y[2];
end

prob = ODEProblem(syst, u0, tspan)
sol = solve(prob, saveat=t)

plot(sol)

savefig("03.png")

function syst(dy, y, p, t)
    dy[1] = -a*y[1];
    dy[2] = a*y[1]-b*y[2];
    dy[3] = b*y[2];
end

prob = ODEProblem(syst, u0, tspan)
sol = solve(prob, saveat=t)

plot(sol)

savefig("04.png")


