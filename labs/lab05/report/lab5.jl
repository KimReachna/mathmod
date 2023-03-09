1032209334%70+1

using Plots
using DifferentialEquations

x0 = 9
y0 = 20
u0 = [x0; y0]

t0 = 0
tmax = 100
t = collect(LinRange(t0, tmax, 1000))
tspan = (t0, tmax)

a = 0.32
b = 0.04
c = 0.42
d = 0.02

function syst(dy, y, p, t)
    dy[1] = -a*y[1] + b*y[1]*y[2]
    dy[2] = c*y[2] - d*y[1]*y[2]
end

prob = ODEProblem(syst, u0, tspan)
sol = solve(prob, saveat =t)

plot(sol)

savefig("03.png")

plot(sol, idxs=(1, 2))

savefig("04.png")


