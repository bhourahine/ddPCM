#
#   Makefile for ddCOSMO
#
RunF77 = ifort
FFLAGS = -O3 -xHost -qopenmp
RunF77 = gfortran
FFLAGS = -O3 -march=native -fopenmp -std=f2008 -pedantic
F77FLAGS = -O3 -march=native -fopenmp -std=legacy -pedantic
#RunF77 = pgfortran
#FFLAGS = -O3 -mp

MODS   = ddcosmo.o
OBJS = mkrhs.o llgnew.o efld.o ddcosmo.o forces_dd.o	\
	jacobi_diis.o matvec.o cosmo.o main.o
#
all:    $(MODS) $(OBJS)
	$(RunF77) $(FFLAGS) -o main.exe $(OBJS)
#
%.o: %.f
	$(RunF77) $(FFLAGS) -c $*.f
%.o: %.f90
	$(RunF77) $(FFLAGS) -c $*.f90
#
clean:
	rm -fr $(OBJS) *.exe *.mod
