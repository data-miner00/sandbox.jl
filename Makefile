ifeq ($(OS), Windows_NT)
activate:
	julia --project=.
test:
	julia ./test/testrunner.jl
check:
	julia ./scripts/mod.jl
install:
	julia --project=. -e 'using Pkg; Pkg.instantiate()'
endif