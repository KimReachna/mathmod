1032205204%70+1

using Plots
using DifferentialEquations

x0 = 22222
y0 = 11111

t0 = 0
tmax = 1

a = 0.22
b = 0.77
c = 0.66
h = 0.11

a2 = 0.31
b2 = 0.79
c2 = 0.59
h2 = 0.21

function P(t)
    return sin(0.5*t)+2
end

function Q(t)
    return cos(0.5*t)+2
end

function P2(t)
    return sin(2.5*t)+1
end

function Q2(t)
    return cos(2*t)+2
end

function syst(dy, y, p, t)
    dy[1] = -a*y[1] - b*y[2] + P(t)
    dy[2] = -c*y[1] - h*y[2] + Q(t)
end

function syst2(dy, y, p, t)
    dy[1] = -a2*y[1] - b2*y[2] + P2(t)
    dy[2] = -c2*y[1]*y[2] - h2*y[2] + Q2(t)
end

u0 = [x0; y0]
tspan = (t0, tmax)
t = collect(LinRange(0, 1, 100))

prob = ODEProblem(syst, u0, tspan)
prob2 = ODEProblem(syst2, u0, tspan)

sol = solve(prob, saveat=t)
sol2 = solve(prob2, saveat=t)

plot(sol)

savefig("03.png")

plot(sol2)

savefig("04.png")


