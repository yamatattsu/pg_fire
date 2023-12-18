EXTENSION = pg_fire
DATA = pg_fire--1.0.sql
PGFILEDESC = "pg_fire - Fire effect on PostgreSQL"

ifdef NO_PGXS
subdir = contrib/pg_fire
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
else
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
endif

