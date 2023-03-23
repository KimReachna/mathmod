1032205204%70+1

using Plots
using DifferentialEquations

a = 0.288
b = 0.000018
N = 3030
n = 24

tmax = 8
tspan = (0, tmax)
t = collect(LinRange(0, tmax, 500))

function syst(dy, y, p, t)
    dy[1] = (a+b*y[1])*(N-y[1])
end

prob = ODEProblem(syst, [n], tspan)
sol = solve(prob, saveat=t)

plot(sol)

savefig("04.png")

a = 0.000018
b = 0.377
N = 3030
n = 24

tmax = 0.01
tspan = (0, tmax)
t = collect(LinRange(0, tmax, 500))

function syst(dy, y, p, t)
    dy[1] = (a+b*y[1])*(N-y[1])
end

prob = ODEProblem(syst, [n], tspan)
sol = solve(prob, saveat=t)

plot(sol)

savefig("05.png")

a = 0.1
b = 0.4
N = 3030
n = 24

tmax = 0.01
tspan = (0, tmax)
t = collect(LinRange(0, tmax, 500))

function syst(dy, y, p, t)
    dy[1] = (a*t+b*cos(t)*y[1])*(N-y[1])
end

prob = ODEProblem(syst, [n], tspan)
sol = solve(prob, saveat=t)

plot(sol)

savefig("06.png")


